Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E01F294EF3
	for <lists.virtualization@lfdr.de>; Wed, 21 Oct 2020 16:43:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4E526873F0;
	Wed, 21 Oct 2020 14:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8KIyr3bGLkbS; Wed, 21 Oct 2020 14:43:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 61E0C871C7;
	Wed, 21 Oct 2020 14:43:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3944DC0051;
	Wed, 21 Oct 2020 14:43:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72948C0051
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Oct 2020 14:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 60AD7873F0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Oct 2020 14:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WTg4hpNQDgr6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Oct 2020 14:43:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4BCDB871C7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Oct 2020 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603291395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I+LXC1KoV/7wz8+ccySiFrURJV52SFpHKWLbovJ/+rk=;
 b=O1ip/UALqeoUlrWcBaKsicqqdm9ADikHwg6hnzXRwGX6bR2Q0OLh0u/ooMbsQxzOJXBWGM
 QfO+5bVWoPP/wI8JDSpk8SAVO7SCShtrhi6yJKkiksZxBCBh/ghBQE5FVAGGeY2loB8VBW
 LVZgHZrI8GSVqcQxng2u1CbeB1kzN6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-gVt3ilKKMfKdSCpIviWiCQ-1; Wed, 21 Oct 2020 10:43:11 -0400
X-MC-Unique: gVt3ilKKMfKdSCpIviWiCQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D70F818B9FF1;
 Wed, 21 Oct 2020 14:43:09 +0000 (UTC)
Received: from redhat.com (ovpn-115-38.ams2.redhat.com [10.36.115.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2735E5F9C1;
 Wed, 21 Oct 2020 14:43:06 +0000 (UTC)
Date: Wed, 21 Oct 2020 10:43:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Subject: Re: [PATCH v3] virtio-rng: return available data with O_NONBLOCK
Message-ID: <20201021104239-mutt-send-email-mst@kernel.org>
References: <20200811142821.12323-1-mwilck@suse.com>
 <4ae4f348-c186-f7e4-f7e3-b1f1e4a4b408@redhat.com>
 <20200826082613-mutt-send-email-mst@kernel.org>
 <519e0296a7d61d5e9e8d258a855eb42a57c641c5.camel@suse.com>
 <a5d4bcd3-e468-e818-3bd2-3a1b0fa172d8@redhat.com>
 <20200908101413-mutt-send-email-mst@kernel.org>
 <0a5fcbc9bb6eef521c627035687de4654a1dd740.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <0a5fcbc9bb6eef521c627035687de4654a1dd740.camel@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Sep 08, 2020 at 05:33:40PM +0200, Martin Wilck wrote:
> On Tue, 2020-09-08 at 10:14 -0400, Michael S. Tsirkin wrote:
> > On Mon, Aug 31, 2020 at 02:37:26PM +0200, Laurent Vivier wrote:
> > > On 28/08/2020 23:34, Martin Wilck wrote:
> > > > On Wed, 2020-08-26 at 08:26 -0400, Michael S. Tsirkin wrote:
> > > > > On Tue, Aug 11, 2020 at 04:42:32PM +0200, Laurent Vivier wrote:
> > > > > > On 11/08/2020 16:28, mwilck@suse.com wrote:
> > > > > > > From: Martin Wilck <mwilck@suse.com>
> > > > > > > 
> > > > > > > If a program opens /dev/hwrng with O_NONBLOCK and uses
> > > > > > > poll() and
> > > > > > > non-blocking read() to retrieve random data, it ends up in
> > > > > > > a
> > > > > > > tight
> > > > > > > loop with poll() always returning POLLIN and read()
> > > > > > > returning
> > > > > > > EAGAIN.
> > > > > > > This repeats forever until some process makes a blocking
> > > > > > > read()
> > > > > > > call.
> > > > > > > The reason is that virtio_read() always returns 0 in non-
> > > > > > > blocking 
> > > > > > > mode,
> > > > > > > even if data is available. Worse, it fetches random data
> > > > > > > from the
> > > > > > > hypervisor after every non-blocking call, without ever
> > > > > > > using this
> > > > > > > data.
> > > > > > > 
> > > > > > > The following test program illustrates the behavior and can
> > > > > > > be
> > > > > > > used
> > > > > > > for testing and experiments. The problem will only be seen
> > > > > > > if all
> > > > > > > tasks use non-blocking access; otherwise the blocking reads
> > > > > > > will
> > > > > > > "recharge" the random pool and cause other, non-blocking
> > > > > > > reads to
> > > > > > > succeed at least sometimes.
> > > > > > > 
> > > > > > > /* Whether to use non-blocking mode in a task, problem
> > > > > > > occurs if
> > > > > > > CONDITION is 1 */
> > > > > > > //#define CONDITION (getpid() % 2 != 0)
> > > > > > > 
> > > > > > > static volatile sig_atomic_t stop;
> > > > > > > static void handler(int sig __attribute__((unused))) { stop
> > > > > > > = 1;
> > > > > > > }
> > > > > > > 
> > > > > > > static void loop(int fd, int sec)
> > > > > > > {
> > > > > > > 	struct pollfd pfd = { .fd = fd, .events  = POLLIN, };
> > > > > > > 	unsigned long errors = 0, eagains = 0, bytes = 0, succ
> > > > > > > = 0;
> > > > > > > 	int size, rc, rd;
> > > > > > > 
> > > > > > > 	srandom(getpid());
> > > > > > > 	if (CONDITION && fcntl(fd, F_SETFL, fcntl(fd, F_GETFL)
> > > > > > > |
> > > > > > > O_NONBLOCK) == -1)
> > > > > > > 		perror("fcntl");
> > > > > > > 	size = MINBUFSIZ + random() % (MAXBUFSIZ - MINBUFSIZ +
> > > > > > > 1);
> > > > > > > 
> > > > > > > 	for(;;) {
> > > > > > > 		char buf[size];
> > > > > > > 
> > > > > > > 		if (stop)
> > > > > > > 			break;
> > > > > > > 		rc = poll(&pfd, 1, sec);
> > > > > > > 		if (rc > 0) {
> > > > > > > 			rd = read(fd, buf, sizeof(buf));
> > > > > > > 			if (rd == -1 && errno == EAGAIN)
> > > > > > > 				eagains++;
> > > > > > > 			else if (rd == -1)
> > > > > > > 				errors++;
> > > > > > > 			else {
> > > > > > > 				succ++;
> > > > > > > 				bytes += rd;
> > > > > > > 				write(1, buf, sizeof(buf));
> > > > > > > 			}
> > > > > > > 		} else if (rc == -1) {
> > > > > > > 			if (errno != EINTR)
> > > > > > > 				perror("poll");
> > > > > > > 			break;
> > > > > > > 		} else
> > > > > > > 			fprintf(stderr, "poll: timeout\n");
> > > > > > > 	}
> > > > > > > 	fprintf(stderr,
> > > > > > > 		"pid %d %sblocking, bufsize %d, %d seconds, %lu
> > > > > > > bytes
> > > > > > > read, %lu success, %lu eagain, %lu errors\n",
> > > > > > > 		getpid(), CONDITION ? "non-" : "", size, sec,
> > > > > > > bytes,
> > > > > > > succ, eagains, errors);
> > > > > > > }
> > > > > > > 
> > > > > > > int main(void)
> > > > > > > {
> > > > > > > 	int fd;
> > > > > > > 
> > > > > > > 	fork(); fork();
> > > > > > > 	fd = open("/dev/hwrng", O_RDONLY);
> > > > > > > 	if (fd == -1) {
> > > > > > > 		perror("open");
> > > > > > > 		return 1;
> > > > > > > 	};
> > > > > > > 	signal(SIGALRM, handler);
> > > > > > > 	alarm(SECONDS);
> > > > > > > 	loop(fd, SECONDS);
> > > > > > > 	close(fd);
> > > > > > > 	wait(NULL);
> > > > > > > 	return 0;
> > > > > > > }
> > > > > > > 
> > > > > > > void loop(int fd)
> > > > > > > {
> > > > > > >         struct pollfd pfd0 = { .fd = fd, .events  = POLLIN,
> > > > > > > };
> > > > > > >         int rc;
> > > > > > >         unsigned int n;
> > > > > > > 
> > > > > > >         for (n = LOOPS; n > 0; n--) {
> > > > > > >                 struct pollfd pfd = pfd0;
> > > > > > >                 char buf[SIZE];
> > > > > > > 
> > > > > > >                 rc = poll(&pfd, 1, 1);
> > > > > > >                 if (rc > 0) {
> > > > > > >                         int rd = read(fd, buf,
> > > > > > > sizeof(buf));
> > > > > > > 
> > > > > > >                         if (rd == -1)
> > > > > > >                                 perror("read");
> > > > > > >                         else
> > > > > > >                                 printf("read %d bytes\n",
> > > > > > > rd);
> > > > > > >                 } else if (rc == -1)
> > > > > > >                         perror("poll");
> > > > > > >                 else
> > > > > > >                         fprintf(stderr, "timeout\n");
> > > > > > > 
> > > > > > >         }
> > > > > > > }
> > > > > > > 
> > > > > > > int main(void)
> > > > > > > {
> > > > > > >         int fd;
> > > > > > > 
> > > > > > >         fd = open("/dev/hwrng", O_RDONLY|O_NONBLOCK);
> > > > > > >         if (fd == -1) {
> > > > > > >                 perror("open");
> > > > > > >                 return 1;
> > > > > > >         };
> > > > > > >         loop(fd);
> > > > > > >         close(fd);
> > > > > > >         return 0;
> > > > > > > }
> > > > > > > 
> > > > > > > This can be observed in the real word e.g. with nested
> > > > > > > qemu/KVM
> > > > > > > virtual
> > > > > > > machines, if both the "outer" and "inner" VMs have a
> > > > > > > virtio-rng
> > > > > > > device.
> > > > > > > If the "inner" VM requests random data, qemu running in the
> > > > > > > "outer" VM
> > > > > > > uses this device in a non-blocking manner like the test
> > > > > > > program
> > > > > > > above.
> > > > > > > 
> > > > > > > Fix it by returning available data if a previous hypervisor
> > > > > > > call
> > > > > > > has
> > > > > > > completed. I tested this patch with the program above, and
> > > > > > > with
> > > > > > > rng-tools.
> > > > > > > 
> > > > > > > v2 -> v3: Simplified the implementation as suggested by
> > > > > > > Laurent
> > > > > > > Vivier
> > > > > > > 
> > > > > > > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > > > > > > ---
> > > > > > >  drivers/char/hw_random/virtio-rng.c | 4 ++--
> > > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/char/hw_random/virtio-rng.c
> > > > > > > b/drivers/char/hw_random/virtio-rng.c
> > > > > > > index a90001e02bf7..8eaeceecb41e 100644
> > > > > > > --- a/drivers/char/hw_random/virtio-rng.c
> > > > > > > +++ b/drivers/char/hw_random/virtio-rng.c
> > > > > > > @@ -65,7 +65,7 @@ static int virtio_read(struct hwrng *rng,
> > > > > > > void
> > > > > > > *buf, size_t size, bool wait)
> > > > > > >  		register_buffer(vi, buf, size);
> > > > > > >  	}
> > > > > > >  
> > > > > > > -	if (!wait)
> > > > > > > +	if (!wait && !completion_done(&vi->have_data))
> > > > > > >  		return 0;
> > > > > > >  
> > > > > > >  	ret = wait_for_completion_killable(&vi->have_data);
> > > > > > > @@ -74,7 +74,7 @@ static int virtio_read(struct hwrng *rng,
> > > > > > > void
> > > > > > > *buf, size_t size, bool wait)
> > > > > > >  
> > > > > > >  	vi->busy = false;
> > > > > > >  
> > > > > > > -	return vi->data_avail;
> > > > > > > +	return min_t(size_t, size, vi->data_avail);
> > > > > > >  }
> > > > > > >  
> > > > > > >  static void virtio_cleanup(struct hwrng *rng)
> > > > > > > 
> > > > > > 
> > > > > > Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> > > > > 
> > > > > Laurent didn't we agree the real fix is private buffers in the
> > > > > driver,
> > > > > and copying out from there?
> > > > > 
> > > > 
> > > > Can we perhaps proceed with this for now? AFAICS the private
> > > > buffer
> > > > implementation would be a larger effort, while we have the issues
> > > > with
> > > > nested VMs getting no entropy today.
> > > > 
> > > 
> > > I agree. I think it's important to have a simple and quick fix for
> > > the
> > > problem reported by Martin.
> > > 
> > > We need the private buffers but not sure how long it will take to
> > > have
> > > them included in the kernel and how many new bugs will be
> > > introduced
> > > doing that as the code is hard to understand and the core is shared
> > > with
> > > several other hardware backends that can be impacted by the changes
> > > needed.
> > > 
> > > Thanks,
> > > Laurent
> > 
> > However I am not sure with the patch applies we never return
> > the same buffer to userspace twice, e.g. if one is
> > non blocking another blocking. Doing that would be a bug.
> > 
> 
> As Laurent mentioned in 
> https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg02039.html,
> there are only 2 different buffers that may be passed to virtio_read(),
> rng_buffer and rng_fillbuf.
> The latter is only used in blocking mode.
> 
> AFAICS there's just one problematic situation: 
> 
>  1 a user space process reads random data without blocking and runs
> register_buffer(), gets no data, releases reading_mutex
>  2 the hwrng kthread grabs the mutex and makes a sync call, vi->busy is
> still set, so no new completion is initialized.
>  3 hwrng calls wait_for_completion_killable() and sees the completion
>    that had been initialized by the user space process previously,
>  4 hwrng "thinks" it got some positive randomness, but random data have
>    actually been written into rng_buffer, not rng_fillbuff.
> 
> This is indeed bad, but it can happen with the current code as well.
> Actually, it's more likely to happen with the current code, because
> asynchronous callers might hang forever trying to get entropy,
> making this scenario more likely (if there's a process, like nested
> qemu, that would keep calling . So this wouldn't be a regression caused
> by my patch, AFAICT.
> 
> How can we avoid this problem entirely? A) With private buffers, of
> course. B) Another, a bit hackish, approach would be to remember the
> active "buffer" pointer in virtio_rng, and restart the IO when a
> another buffer is passed down. C) Finally, we could modify
> virtio_read() such that blocking calls always re-initialize the buffer;
> they'd then have to wait for a potential already running IO from a
> previous, non-blocking access to finish first.
> 
> But I believe this is something which could (and should) be done
> independently. Alternatively, I could add B) or C). A) I'd rather leave
> to Laurent.
> 
> Regards,
> Martin
> 

C sounds good to me. Laurent?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
