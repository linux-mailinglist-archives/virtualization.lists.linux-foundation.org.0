Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D581291373
	for <lists.virtualization@lfdr.de>; Sat, 17 Oct 2020 20:10:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 948E987BE3;
	Sat, 17 Oct 2020 18:10:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id phpl-bYTS-GN; Sat, 17 Oct 2020 18:10:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BEC9D87848;
	Sat, 17 Oct 2020 18:10:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95497C0051;
	Sat, 17 Oct 2020 18:10:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 032C0C0051
 for <virtualization@lists.linux-foundation.org>;
 Sat, 17 Oct 2020 18:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E128887848
 for <virtualization@lists.linux-foundation.org>;
 Sat, 17 Oct 2020 18:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vAtzA3N3mucK
 for <virtualization@lists.linux-foundation.org>;
 Sat, 17 Oct 2020 18:10:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 37C3A8783B
 for <virtualization@lists.linux-foundation.org>;
 Sat, 17 Oct 2020 18:10:40 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7EF3320897
 for <virtualization@lists.linux-foundation.org>;
 Sat, 17 Oct 2020 18:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602958239;
 bh=bNUjXzAtYTeF0xeyT4fVDlewqtbmx5JXgMhZlub6oWs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=THGcrhra0XvZn4Ey1MGpMDVxtKDNQHgmX2j9JxAUeoHswlBA6Cnm/zT4hTZODIzHR
 GIAP9ZD/E/9dmpMs96WF1G45M6M/NevjFPyBmIiwND5y72ADgjpFd1WGLuu3J/se7p
 O3hmHiqDp9e1W5jgnKbn1xURn1TnVQtFlfaePNuA=
Received: by mail-wm1-f43.google.com with SMTP id d3so8740994wma.4
 for <virtualization@lists.linux-foundation.org>;
 Sat, 17 Oct 2020 11:10:39 -0700 (PDT)
X-Gm-Message-State: AOAM531gD4Z+fmLheoB+fN/gXG139mxTTbqCIEQp6HRkXPEQbz3eCvU/
 8RNxIErtZ6D9+2QsiU8Mxc6DDz0tNh0/m2v6zcIMCA==
X-Google-Smtp-Source: ABdhPJytCiWOtxm84RCgZCVoArKJ0KdKOuxfgPiMKVnnwQm0gaac8Rg/0NC502KkEJ0/X88L4LXO8HEf81QzCgT9VjQ=
X-Received: by 2002:a1c:6457:: with SMTP id y84mr9330642wmb.36.1602958237946; 
 Sat, 17 Oct 2020 11:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <788878CE-2578-4991-A5A6-669DCABAC2F2@amazon.com>
 <CAG48ez0EanBvDyfthe+hAP0OC8iGLNSq2e5wJVz-=ENNGF97_w@mail.gmail.com>
In-Reply-To: <CAG48ez0EanBvDyfthe+hAP0OC8iGLNSq2e5wJVz-=ENNGF97_w@mail.gmail.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Sat, 17 Oct 2020 11:10:26 -0700
X-Gmail-Original-Message-ID: <CALCETrViTg_BWvRa+nfDWq=_B_ithzL-anVJNpsgHaXe9VgCNQ@mail.gmail.com>
Message-ID: <CALCETrViTg_BWvRa+nfDWq=_B_ithzL-anVJNpsgHaXe9VgCNQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/virt: vmgenid: add vm generation id driver
To: Jann Horn <jannh@google.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Jason Donenfeld <Jason@zx2c4.com>, KVM list <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "ghammer@redhat.com" <ghammer@redhat.com>, "Weiss, Radu" <raduweis@amazon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Pavel Machek <pavel@ucw.cz>,
 "corbet@lwn.net" <corbet@lwn.net>, "mst@redhat.com" <mst@redhat.com>,
 Eric Biggers <ebiggers@kernel.org>, "Singh, Balbir" <sblbir@amazon.com>,
 "bonzini@gnu.org" <bonzini@gnu.org>, "Graf \(AWS\),
 Alexander" <graf@amazon.de>, Michal Hocko <mhocko@kernel.org>,
 "oridgar@gmail.com" <oridgar@gmail.com>, "Catangiu,
 Adrian Costin" <acatan@amazon.com>, Andy Lutomirski <luto@kernel.org>,
 "MacCarthaigh, Colm" <colmmacc@amazon.com>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Willy Tarreau <w@1wt.eu>, "Woodhouse, David" <dwmw@amazon.co.uk>
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

On Fri, Oct 16, 2020 at 6:40 PM Jann Horn <jannh@google.com> wrote:
>
> [adding some more people who are interested in RNG stuff: Andy, Jason,
> Theodore, Willy Tarreau, Eric Biggers. also linux-api@, because this
> concerns some pretty fundamental API stuff related to RNG usage]
>
> On Fri, Oct 16, 2020 at 4:33 PM Catangiu, Adrian Costin
> <acatan@amazon.com> wrote:
> > - Background
> >
> > The VM Generation ID is a feature defined by Microsoft (paper:
> > http://go.microsoft.com/fwlink/?LinkId=260709) and supported by
> > multiple hypervisor vendors.
> >
> > The feature is required in virtualized environments by apps that work
> > with local copies/caches of world-unique data such as random values,
> > uuids, monotonically increasing counters, etc.
> > Such apps can be negatively affected by VM snapshotting when the VM
> > is either cloned or returned to an earlier point in time.
> >
> > The VM Generation ID is a simple concept meant to alleviate the issue
> > by providing a unique ID that changes each time the VM is restored
> > from a snapshot. The hw provided UUID value can be used to
> > differentiate between VMs or different generations of the same VM.
> >
> > - Problem
> >
> > The VM Generation ID is exposed through an ACPI device by multiple
> > hypervisor vendors but neither the vendors or upstream Linux have no
> > default driver for it leaving users to fend for themselves.
> >
> > Furthermore, simply finding out about a VM generation change is only
> > the starting point of a process to renew internal states of possibly
> > multiple applications across the system. This process could benefit
> > from a driver that provides an interface through which orchestration
> > can be easily done.
> >
> > - Solution
> >
> > This patch is a driver which exposes the Virtual Machine Generation ID
> > via a char-dev FS interface that provides ID update sync and async
> > notification, retrieval and confirmation mechanisms:
> >
> > When the device is 'open()'ed a copy of the current vm UUID is
> > associated with the file handle. 'read()' operations block until the
> > associated UUID is no longer up to date - until HW vm gen id changes -
> > at which point the new UUID is provided/returned. Nonblocking 'read()'
> > uses EWOULDBLOCK to signal that there is no _new_ UUID available.
> >
> > 'poll()' is implemented to allow polling for UUID updates. Such
> > updates result in 'EPOLLIN' events.
> >
> > Subsequent read()s following a UUID update no longer block, but return
> > the updated UUID. The application needs to acknowledge the UUID update
> > by confirming it through a 'write()'.
> > Only on writing back to the driver the right/latest UUID, will the
> > driver mark this "watcher" as up to date and remove EPOLLIN status.
> >
> > 'mmap()' support allows mapping a single read-only shared page which
> > will always contain the latest UUID value at offset 0.
>
> It would be nicer if that page just contained an incrementing counter,
> instead of a UUID. It's not like the application cares *what* the UUID
> changed to, just that it *did* change and all RNGs state now needs to
> be reseeded from the kernel, right? And an application can't reliably
> read the entire UUID from the memory mapping anyway, because the VM
> might be forked in the middle.
>
> So I think your kernel driver should detect UUID changes and then turn
> those into a monotonically incrementing counter. (Probably 64 bits
> wide?) (That's probably also a little bit faster than comparing an
> entire UUID.)
>
> An option might be to put that counter into the vDSO, instead of a
> separate VMA; but I don't know how the other folks feel about that.
> Andy, do you have opinions on this? That way, normal userspace code
> that uses this infrastructure wouldn't have to mess around with a
> special device at all. And it'd be usable in seccomp sandboxes and so
> on without needing special plumbing. And libraries wouldn't have to
> call open() and mess with file descriptor numbers.

The vDSO might be annoyingly slow for this.  Something like the rseq
page might make sense.  It could be a generic indication of "system
went through some form of suspend".
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
