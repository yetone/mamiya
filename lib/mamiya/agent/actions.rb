module Mamiya
  class Agent
    module Actions
      def order_task(task, coalesce: false, labels: nil, **payload)
        payload[:_labels] = labels if labels
        trigger('task',
          coalesce: coalesce,
          task: task,
          **payload,
        )
      end

      def distribute(application, package, labels: nil)
        order_task('fetch', app: application, pkg: package, labels: labels)
      end
      end
    end
  end
end
