Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CE6292C69
	for <lists.virtualization@lfdr.de>; Mon, 19 Oct 2020 19:15:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4365E86B22;
	Mon, 19 Oct 2020 17:15:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y5Fx7ZZA_Rkd; Mon, 19 Oct 2020 17:15:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8097F86C95;
	Mon, 19 Oct 2020 17:15:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61BF0C0051;
	Mon, 19 Oct 2020 17:15:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 939DAC0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 17:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7A3AB87270
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 17:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNHXG4XBKXna
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 17:15:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AE8EA87267
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 17:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id AADCB2707BD;
 Mon, 19 Oct 2020 13:15:03 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QTruwX3BYTn2; Mon, 19 Oct 2020 13:15:03 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 284FE270752;
 Mon, 19 Oct 2020 13:15:03 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 284FE270752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1603127703;
 bh=a4Kyq9ggmnqJgL1OMZgiL3YI8Vq7lTIeBQc5QZoN7D4=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=Rleo5KpYLxJL9bE+eS/IDKaOFoEmvkq70bRu+JU0FvBo/l/SmYGCBDQs+xaFOFVHh
 BJLQKLA6tCK8ZaIUWSrsP9eNGLLZGdYFBrCmdjHdnSkKFJRiWBCddq7bINqO1JrS6z
 LiDZeRjCGch2dLFOuXwqHnn+Ivxs2sOrIF5lAwNdQIXqAC1yn7Wcp2M95eK+hTAjh2
 2bA+wXNULdWuS9DpiktZT7bNyAwruDfMklfP+qTv7VM9LXYilPo5xXvaq8H58JbRBX
 xy5xAXA9Jfvdh96AGWs2I075RgU0Y4TmN5l6CqHVGnXdNU7ZWMEVZ3OrX5Vg/g/cFz
 WJ9MFFce5aMuQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id yP-ztTyztNwI; Mon, 19 Oct 2020 13:15:03 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 0FA782707BC;
 Mon, 19 Oct 2020 13:15:03 -0400 (EDT)
Date: Mon, 19 Oct 2020 13:15:02 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Andy Lutomirski <luto@kernel.org>
Message-ID: <476895871.28084.1603127702969.JavaMail.zimbra@efficios.com>
In-Reply-To: <CALCETrViTg_BWvRa+nfDWq=_B_ithzL-anVJNpsgHaXe9VgCNQ@mail.gmail.com>
References: <788878CE-2578-4991-A5A6-669DCABAC2F2@amazon.com>
 <CAG48ez0EanBvDyfthe+hAP0OC8iGLNSq2e5wJVz-=ENNGF97_w@mail.gmail.com>
 <CALCETrViTg_BWvRa+nfDWq=_B_ithzL-anVJNpsgHaXe9VgCNQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/virt: vmgenid: add vm generation id driver
MIME-Version: 1.0
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF81 (Linux)/8.8.15_GA_3968)
Thread-Topic: drivers/virt: vmgenid: add vm generation id driver
Thread-Index: LGqdszkWAp7MsnjacXz6ZDq20p5wzw==
Cc: Jason Donenfeld <Jason@zx2c4.com>, KVM list <kvm@vger.kernel.org>,
 "open list, DOCUMENTATION" <linux-doc@vger.kernel.org>, ghammer@redhat.com,
 "Weiss, Radu" <raduweis@amazon.com>, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, Pavel Machek <pavel@ucw.cz>,
 Jonathan Corbet <corbet@lwn.net>, mst@redhat.com,
 Eric Biggers <ebiggers@kernel.org>, "Singh, Balbir" <sblbir@amazon.com>,
 bonzini@gnu.org, "Graf \(AWS\), Alexander" <graf@amazon.de>,
 Michal Hocko <mhocko@kernel.org>, Jann Horn <jannh@google.com>,
 oridgar@gmail.com, "Catangiu, Adrian Costin" <acatan@amazon.com>,
 "MacCarthaigh, Colm" <colmmacc@amazon.com>, Theodore Tso <tytso@mit.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-api <linux-api@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
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

----- On Oct 17, 2020, at 2:10 PM, Andy Lutomirski luto@kernel.org wrote:

> On Fri, Oct 16, 2020 at 6:40 PM Jann Horn <jannh@google.com> wrote:
>>
>> [adding some more people who are interested in RNG stuff: Andy, Jason,
>> Theodore, Willy Tarreau, Eric Biggers. also linux-api@, because this
>> concerns some pretty fundamental API stuff related to RNG usage]
>>
>> On Fri, Oct 16, 2020 at 4:33 PM Catangiu, Adrian Costin
>> <acatan@amazon.com> wrote:
>> > - Background
>> >
>> > The VM Generation ID is a feature defined by Microsoft (paper:
>> > http://go.microsoft.com/fwlink/?LinkId=260709) and supported by
>> > multiple hypervisor vendors.
>> >
>> > The feature is required in virtualized environments by apps that work
>> > with local copies/caches of world-unique data such as random values,
>> > uuids, monotonically increasing counters, etc.
>> > Such apps can be negatively affected by VM snapshotting when the VM
>> > is either cloned or returned to an earlier point in time.
>> >
>> > The VM Generation ID is a simple concept meant to alleviate the issue
>> > by providing a unique ID that changes each time the VM is restored
>> > from a snapshot. The hw provided UUID value can be used to
>> > differentiate between VMs or different generations of the same VM.
>> >
>> > - Problem
>> >
>> > The VM Generation ID is exposed through an ACPI device by multiple
>> > hypervisor vendors but neither the vendors or upstream Linux have no
>> > default driver for it leaving users to fend for themselves.
>> >
>> > Furthermore, simply finding out about a VM generation change is only
>> > the starting point of a process to renew internal states of possibly
>> > multiple applications across the system. This process could benefit
>> > from a driver that provides an interface through which orchestration
>> > can be easily done.
>> >
>> > - Solution
>> >
>> > This patch is a driver which exposes the Virtual Machine Generation ID
>> > via a char-dev FS interface that provides ID update sync and async
>> > notification, retrieval and confirmation mechanisms:
>> >
>> > When the device is 'open()'ed a copy of the current vm UUID is
>> > associated with the file handle. 'read()' operations block until the
>> > associated UUID is no longer up to date - until HW vm gen id changes -
>> > at which point the new UUID is provided/returned. Nonblocking 'read()'
>> > uses EWOULDBLOCK to signal that there is no _new_ UUID available.
>> >
>> > 'poll()' is implemented to allow polling for UUID updates. Such
>> > updates result in 'EPOLLIN' events.
>> >
>> > Subsequent read()s following a UUID update no longer block, but return
>> > the updated UUID. The application needs to acknowledge the UUID update
>> > by confirming it through a 'write()'.
>> > Only on writing back to the driver the right/latest UUID, will the
>> > driver mark this "watcher" as up to date and remove EPOLLIN status.
>> >
>> > 'mmap()' support allows mapping a single read-only shared page which
>> > will always contain the latest UUID value at offset 0.
>>
>> It would be nicer if that page just contained an incrementing counter,
>> instead of a UUID. It's not like the application cares *what* the UUID
>> changed to, just that it *did* change and all RNGs state now needs to
>> be reseeded from the kernel, right? And an application can't reliably
>> read the entire UUID from the memory mapping anyway, because the VM
>> might be forked in the middle.
>>
>> So I think your kernel driver should detect UUID changes and then turn
>> those into a monotonically incrementing counter. (Probably 64 bits
>> wide?) (That's probably also a little bit faster than comparing an
>> entire UUID.)
>>
>> An option might be to put that counter into the vDSO, instead of a
>> separate VMA; but I don't know how the other folks feel about that.
>> Andy, do you have opinions on this? That way, normal userspace code
>> that uses this infrastructure wouldn't have to mess around with a
>> special device at all. And it'd be usable in seccomp sandboxes and so
>> on without needing special plumbing. And libraries wouldn't have to
>> call open() and mess with file descriptor numbers.
> 
> The vDSO might be annoyingly slow for this.  Something like the rseq
> page might make sense.  It could be a generic indication of "system
> went through some form of suspend".

This might indeed fit nicely as an extension of my KTLS prototype (extensible rseq):

https://lore.kernel.org/lkml/20200925181518.4141-1-mathieu.desnoyers@efficios.com/

There are a few ways we could wire things up. One might be to add the
UUID field into the extended KTLS structure (so it's always updated after it
changes on next return to user-space). For this I assume that the Linux scheduler
within the guest VM always preempts all threads before a VM is suspended (is that
indeed true ?).

This leads to one important question though: how is the UUID check vs commit operation
made atomic with respect to suspend ? Unless we use rseq critical sections in assembly,
where the kernel will abort the rseq critical section on preemption, I don't see how we
can ensure that the UUID value does not change right after it has been checked, before
the "commit" side-effect. And what is the expected "commit" side-effect ? Is it a store
to a variable in user-space memory, or is it issuing a system call which sends a packet over
the network ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
