Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 24823290E80
	for <lists.virtualization@lfdr.de>; Sat, 17 Oct 2020 03:40:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F18FC885EE;
	Sat, 17 Oct 2020 01:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t10nvUt2RDB8; Sat, 17 Oct 2020 01:40:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D1319885A8;
	Sat, 17 Oct 2020 01:40:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6F7DC0051;
	Sat, 17 Oct 2020 01:40:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B44ABC0051
 for <virtualization@lists.linux-foundation.org>;
 Sat, 17 Oct 2020 01:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 797AE204AC
 for <virtualization@lists.linux-foundation.org>;
 Sat, 17 Oct 2020 01:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pd+Q4GOPcUiP
 for <virtualization@lists.linux-foundation.org>;
 Sat, 17 Oct 2020 01:40:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 32060204A1
 for <virtualization@lists.linux-foundation.org>;
 Sat, 17 Oct 2020 01:40:37 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id 184so5632649lfd.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Oct 2020 18:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BopKGQtPaTfGwvlC86xQaWETvH2e42ZAR9Kr5ZDpv5s=;
 b=dQiCd8XyqN/Fitc8jJSyUjY0qDqNyPd4ShZrsSIFOTL3hIXs/X4bpKQd9pwCeUBOFb
 rOLxxBpLKrOA8rhA0PKoUKMLfJVMXtBRFwpgtaWBjmnQFfjRPHciUbyHFxHAs2M7Ew5r
 Go6yyxTpGz2QKjj6Qe+uxMDSvLKOxUJLCapzz+Bz4LuJMdcWwb/eeIp4hUxbTF6+EAzG
 xukDvdgot880aXqWOTeg+XakhsxqiTDpmPUY2afjLe/JRu3gDGQclNJUgrrh8wEYaq5e
 oKCRvn2Io8fmIn5mXPhnlbp+xC5dBXEyamkajNc8GtUTODOpFnryQCw4W12GE+nS0sDV
 5jGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BopKGQtPaTfGwvlC86xQaWETvH2e42ZAR9Kr5ZDpv5s=;
 b=Azxopv8oxJNYDq3Pv+Avv6JHRUDInqp9DvD4lfS8/0zuZn0X4WFryebD1935ORaXoe
 80K5hqEFQuTf8qhqlnTAUYCEREq7DqtxgNXqz3t1j1rqTeFe8QUpGP+rxSluE5c7lhWO
 0a21t3lGHa7lEtx7aU5hHgIzjqVt6DO0C69WhrGg32i7CzuTzFmYlAJ+RpT1JvSQ7VpH
 D8/vYLg6KSCf4zVLn+mAXQGupAYEen4OwR2LerfUy7PL2HzOqUjWjhpx0HAyX/1CTYjd
 SI6OxA9S3XDEJIT6DkGlDt6LEdfUa/DRpsSoQwuDuGDNiAdXDHkHxcCy0i7dBj0iuT+v
 9cbg==
X-Gm-Message-State: AOAM530LzRincMAtRPJ7pfV2IjTXe6zRx4pYa36yEOXX8HmswGJO7pQr
 K8OtvlIxUBPstP+BZ5Sk1UQUvwMbD5G3ZDnuTyzv0Q==
X-Google-Smtp-Source: ABdhPJzGuYJEkcAsnQmiRIzfXcMIc/qN2/3dOgPxRLYyuzsdMoyuYhfEYm6oFrU0i0UreLfHV5fP3MEtahH4QnFku+A=
X-Received: by 2002:a19:e308:: with SMTP id a8mr2221438lfh.573.1602898834832; 
 Fri, 16 Oct 2020 18:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <AQHWo8lIfZnFKGe8nkGmhTCXwq5R3w==>
 <788878CE-2578-4991-A5A6-669DCABAC2F2@amazon.com>
In-Reply-To: <788878CE-2578-4991-A5A6-669DCABAC2F2@amazon.com>
Date: Sat, 17 Oct 2020 03:40:08 +0200
Message-ID: <CAG48ez0EanBvDyfthe+hAP0OC8iGLNSq2e5wJVz-=ENNGF97_w@mail.gmail.com>
Subject: Re: [PATCH] drivers/virt: vmgenid: add vm generation id driver
To: "Catangiu, Adrian Costin" <acatan@amazon.com>,
 Andy Lutomirski <luto@kernel.org>, 
 Jason Donenfeld <Jason@zx2c4.com>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Willy Tarreau <w@1wt.eu>, Eric Biggers <ebiggers@kernel.org>
Cc: "bonzini@gnu.org" <bonzini@gnu.org>, "Graf \(AWS\),
 Alexander" <graf@amazon.de>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 KVM list <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "ghammer@redhat.com" <ghammer@redhat.com>,
 "oridgar@gmail.com" <oridgar@gmail.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "Weiss, Radu" <raduweis@amazon.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 "mst@redhat.com" <mst@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "MacCarthaigh,
 Colm" <colmmacc@amazon.com>, "Singh, Balbir" <sblbir@amazon.com>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
From: Jann Horn via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

[adding some more people who are interested in RNG stuff: Andy, Jason,
Theodore, Willy Tarreau, Eric Biggers. also linux-api@, because this
concerns some pretty fundamental API stuff related to RNG usage]

On Fri, Oct 16, 2020 at 4:33 PM Catangiu, Adrian Costin
<acatan@amazon.com> wrote:
> - Background
>
> The VM Generation ID is a feature defined by Microsoft (paper:
> http://go.microsoft.com/fwlink/?LinkId=260709) and supported by
> multiple hypervisor vendors.
>
> The feature is required in virtualized environments by apps that work
> with local copies/caches of world-unique data such as random values,
> uuids, monotonically increasing counters, etc.
> Such apps can be negatively affected by VM snapshotting when the VM
> is either cloned or returned to an earlier point in time.
>
> The VM Generation ID is a simple concept meant to alleviate the issue
> by providing a unique ID that changes each time the VM is restored
> from a snapshot. The hw provided UUID value can be used to
> differentiate between VMs or different generations of the same VM.
>
> - Problem
>
> The VM Generation ID is exposed through an ACPI device by multiple
> hypervisor vendors but neither the vendors or upstream Linux have no
> default driver for it leaving users to fend for themselves.
>
> Furthermore, simply finding out about a VM generation change is only
> the starting point of a process to renew internal states of possibly
> multiple applications across the system. This process could benefit
> from a driver that provides an interface through which orchestration
> can be easily done.
>
> - Solution
>
> This patch is a driver which exposes the Virtual Machine Generation ID
> via a char-dev FS interface that provides ID update sync and async
> notification, retrieval and confirmation mechanisms:
>
> When the device is 'open()'ed a copy of the current vm UUID is
> associated with the file handle. 'read()' operations block until the
> associated UUID is no longer up to date - until HW vm gen id changes -
> at which point the new UUID is provided/returned. Nonblocking 'read()'
> uses EWOULDBLOCK to signal that there is no _new_ UUID available.
>
> 'poll()' is implemented to allow polling for UUID updates. Such
> updates result in 'EPOLLIN' events.
>
> Subsequent read()s following a UUID update no longer block, but return
> the updated UUID. The application needs to acknowledge the UUID update
> by confirming it through a 'write()'.
> Only on writing back to the driver the right/latest UUID, will the
> driver mark this "watcher" as up to date and remove EPOLLIN status.
>
> 'mmap()' support allows mapping a single read-only shared page which
> will always contain the latest UUID value at offset 0.

It would be nicer if that page just contained an incrementing counter,
instead of a UUID. It's not like the application cares *what* the UUID
changed to, just that it *did* change and all RNGs state now needs to
be reseeded from the kernel, right? And an application can't reliably
read the entire UUID from the memory mapping anyway, because the VM
might be forked in the middle.

So I think your kernel driver should detect UUID changes and then turn
those into a monotonically incrementing counter. (Probably 64 bits
wide?) (That's probably also a little bit faster than comparing an
entire UUID.)

An option might be to put that counter into the vDSO, instead of a
separate VMA; but I don't know how the other folks feel about that.
Andy, do you have opinions on this? That way, normal userspace code
that uses this infrastructure wouldn't have to mess around with a
special device at all. And it'd be usable in seccomp sandboxes and so
on without needing special plumbing. And libraries wouldn't have to
call open() and mess with file descriptor numbers.

> The driver also adds support for tracking count of open file handles
> that haven't acknowledged an UUID update. This is exposed through
> two IOCTLs:
>  * VMGENID_GET_OUTDATED_WATCHERS: immediately returns the number of
>    _outdated_ watchers - number of file handles that were open during
>    a VM generation change, and which have not yet confirmed the new
>    Vm-Gen-Id.
>  * VMGENID_WAIT_WATCHERS: blocks until there are no more _outdated_
>    watchers, or if a 'timeout' argument is provided, until the timeout
>    expires.

Does this mean that code that uses the memory mapping to detect
changes is still supposed to confirm generation IDs? What about
multithreaded processes, especially ones that use libraries - if a
library opens a single file descriptor that is used from multiple
threads, is the library required to synchronize all its threads before
confirming the change? That seems like it could get messy. And it
again means that this interface can't easily be used from inside
seccomp sandboxes.

[...]
> diff --git a/Documentation/virt/vmgenid.rst b/Documentation/virt/vmgenid.rst
[...]
> +``close()``:
> +  Removes the file handle as a Vm-Gen-Id watcher.

(Linux doesn't have "file handles". Technically close() just closes a
file descriptor, and if that file descriptor points to the same file
description object (aka struct file) as another file descriptor,
nothing happens.)

> +Example application workflows
> +-----------------------------
> +
> +1) Watchdog thread simplified example::
> +
> +       void watchdog_thread_handler(int *thread_active)
> +       {
> +               uuid_t uuid;
> +               int fd = open("/dev/vmgenid", O_RDWR, S_IRUSR | S_IWUSR);

In case we actually keep this API, you should use O_CLOEXEC here.

> +
> +               do {
> +                       // read new UUID - blocks until VM generation changes
> +                       read(fd, &uuid, sizeof(uuid));
> +
> +                       // because of VM generation change, we need to rebuild world
> +                       reseed_app_env();
> +
> +                       // confirm we're done handling UUID update
> +                       write(fd, &uuid, sizeof(uuid));
> +               } while (atomic_read(thread_active));
> +
> +               close(fd);
> +       }
[...]
> +3) Mapped memory polling simplified example::
> +
> +       /*
> +        * app/library function that provides cached secrets
> +        */
> +       char * safe_cached_secret(app_data_t *app)
> +       {
> +               char *secret;
> +               volatile uuid_t *const uuid_ptr = get_vmgenid_mapping(app);
> +       again:
> +               secret = __cached_secret(app);
> +
> +               if (unlikely(*uuid_ptr != app->cached_uuid)) {
> +                       app->cached_uuid = *uuid_ptr;
> +
> +                       // rebuild world then confirm the uuid update (thru write)
> +                       rebuild_caches(app);
> +                       ack_vmgenid_update(app);
> +
> +                       goto again;
> +               }
> +
> +               return secret;
> +       }
> +
> +4) Orchestrator simplified example::
> +
> +       /*
> +        * orchestrator - manages multiple apps and libraries used by a service
> +        * and tries to make sure all sensitive components gracefully handle
> +        * VM generation changes.
> +        * Following function is called on detection of a VM generation change.
> +        */
> +       int handle_vmgen_update(int vmgenfd, uuid_t new_uuid)
> +       {
> +               // pause until all components have handled event
> +               pause_service();
> +
> +               // confirm *this* watcher as up-to-date
> +               write(fd, &new_uuid, sizeof(uuid_t));
> +
> +               // wait for all *others*
> +               ioctl(fd, VMGENID_WAIT_WATCHERS, NULL);
> +
> +               // all apps on the system have rebuilt worlds
> +               resume_service();
> +       }

Can you describe what value such an "Orchestrator" would add? Because
it seems to me like this will just unnecessarily complicate things.

[...]
> diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
> index fd33124..a1f8dcc 100644
> --- a/drivers/virt/Makefile
> +++ b/drivers/virt/Makefile
> @@ -4,4 +4,5 @@
>  #
>
>  obj-$(CONFIG_FSL_HV_MANAGER)   += fsl_hypervisor.o
> +obj-$(CONFIG_VMGENID)          += vmgenid.o
>  obj-y                          += vboxguest/
> diff --git a/drivers/virt/vmgenid.c b/drivers/virt/vmgenid.c
[...]
> +static int vmgenid_close(struct inode *inode, struct file *file)
> +{
> +       struct file_data *file_data = (struct file_data *) file->private_data;
> +       struct dev_data *priv = file_data->dev_data;
> +
> +       if (!vmgenid_uuid_matches(priv, &file_data->acked_uuid))
> +               vmgenid_put_outdated_watchers(priv);
> +       atomic_dec(&priv->watchers);

What happens if the UUID changes between the previous two calls? Then
the outdated watcher count will go out of sync, right?

(But as I've said, I think that maybe the outdated watcher counting is
a bad idea in general, and we should just get rid of it.)

> +       kfree(file->private_data);
> +
> +       return 0;
> +}
> +
> +static ssize_t
> +vmgenid_read(struct file *file, char __user *ubuf, size_t nbytes, loff_t *ppos)
> +{
> +       struct file_data *file_data =
> +               (struct file_data *) file->private_data;
> +       struct dev_data *priv = file_data->dev_data;
> +       ssize_t ret;
> +
> +       if (nbytes == 0)
> +               return 0;
> +       /* disallow partial UUID reads */
> +       if (nbytes < sizeof(uuid_t))
> +               return -EINVAL;
> +       nbytes = sizeof(uuid_t);
> +
> +       if (vmgenid_uuid_matches(priv, &file_data->acked_uuid)) {
> +               if (file->f_flags & O_NONBLOCK)
> +                       return -EAGAIN;
> +               ret = wait_event_interruptible(
> +                       priv->read_wait,
> +                       !vmgenid_uuid_matches(priv, &file_data->acked_uuid)
> +               );
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret = copy_to_user(ubuf, &priv->uuid, nbytes);

If the VM is again forked in the middle of this, will userspace see a
torn UUID (consisting of half old and half new value)?

> +       if (ret)
> +               return -EFAULT;
> +
> +       return nbytes;
> +}
[...]
> +static vm_fault_t vmgenid_vm_fault(struct vm_fault *vmf)
> +{
> +       struct page *page;
> +       struct file_data *file_data =
> +                       (struct file_data *) vmf->vma->vm_private_data;
> +       struct dev_data *priv = file_data->dev_data;
> +
> +       if (priv->map_buf) {
> +               page = virt_to_page(priv->map_buf);
> +               get_page(page);
> +               vmf->page = page;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct vm_operations_struct vmgenid_vm_ops = {
> +       .fault = vmgenid_vm_fault,
> +};
> +
> +static int vmgenid_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +       if (vma->vm_pgoff != 0 || vma_pages(vma) > 1)
> +               return -EINVAL;
> +
> +       if ((vma->vm_flags & VM_WRITE) != 0)
> +               return -EPERM;

This doesn't work, you also need to clear VM_MAYWRITE. See e.g. binder_mmap().

Also, I think mmap handlers for special mappings like this usually
directly install the page inside the mmap handler, using something
like vm_insert_page(). And then they don't need a ->fault handler.

(But if we decide to put this into the vDSO, the whole memory mapping
thing would become unnecessary anyway.)

> +       vma->vm_ops = &vmgenid_vm_ops;
> +       vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
> +       vma->vm_private_data = file->private_data;
> +
> +       return 0;
> +}
> +
> +static const struct file_operations fops = {
> +       .owner          = THIS_MODULE,
> +       .mmap           = vmgenid_mmap,
> +       .open           = vmgenid_open,
> +       .release        = vmgenid_close,
> +       .read           = vmgenid_read,
> +       .write          = vmgenid_write,
> +       .poll           = vmgenid_poll,
> +       .compat_ioctl   = vmgenid_ioctl,

You don't need to define a compat_ioctl if the normal ioctl handler is the same.

> +       .unlocked_ioctl = vmgenid_ioctl,
> +};
[...]
> +static void vmgenid_acpi_notify(struct acpi_device *device, u32 event)
> +{
> +       uuid_t old_uuid;
> +       struct dev_data *priv;
> +
> +       pr_debug("VMGENID notified, event %u", event);
> +
> +       if (!device || !acpi_driver_data(device)) {
> +               pr_err("VMGENID notify with NULL private data");
> +               return;
> +       }
> +       priv = acpi_driver_data(device);
> +
> +       /* update VM Generation UUID */
> +       old_uuid = priv->uuid;
> +       memcpy_fromio(&priv->uuid, priv->uuid_iomap, sizeof(uuid_t));
> +
> +       if (!vmgenid_uuid_matches(priv, &old_uuid)) {
> +               /* HW uuid updated */
> +               memcpy((void *) priv->map_buf, &priv->uuid, sizeof(uuid_t));
> +               atomic_set(&priv->outdated_watchers,
> +                        atomic_read(&priv->watchers));
> +               wake_up_interruptible(&priv->read_wait);
> +       }
> +}

If we know that the VM just got forked, we should probably also make
sure that we reseed the kernel's internal RNG before we tell userspace
to fetch new RNG seeds from the kernel? Otherwise this is kinda
pointless. Or are we already taking care of that elsewhere? If not, we
should probably mix the UUID into the entropy pool (at least
`write_pool(&input_pool, uuid, sizeof(uuid_t))`, although technically
it would be better to do it in a way that ensures that userspace can't
write the same value into the RNG - maybe we should introduce type
prefixes into write_pool()?) and then trigger a reseed of everything
else (`crng_reseed(&primary_crng, &input_pool)`).
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
