Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7295917442A
	for <lists.virtualization@lfdr.de>; Sat, 29 Feb 2020 02:29:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CA8E48832C;
	Sat, 29 Feb 2020 01:29:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z7fTR5oTNvnF; Sat, 29 Feb 2020 01:29:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 15A048829D;
	Sat, 29 Feb 2020 01:29:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 004A4C0177;
	Sat, 29 Feb 2020 01:29:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A726C0177
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 01:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 421C720382
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 01:29:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0pHeL4Ob5x8h
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 01:29:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 21FBD20378
 for <virtualization@lists.linux-foundation.org>;
 Sat, 29 Feb 2020 01:29:03 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 92E642468D;
 Sat, 29 Feb 2020 01:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582939742;
 bh=Hlhuhpuhp4R8hEWsXpZj7uBncbNCZ47LoTXM6DFCLp0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=sM0o7qz5qywAH/1Ib0u8V+lenOWOi3vSFx7xR+ITFQWAC8SLgi1b2hdpe0X4fS2s4
 LOzqN0rxHdEMDY4nlgc4adx7nMezwKFV+6DR3CkDeuUCAoWpta9fgD1bTxcb8M5hnm
 JSMLFttLfEq5jwtsR/7yDgAhJqI5MwJwI/75mYA0=
Date: Fri, 28 Feb 2020 17:29:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: alex.bennee@linaro.org
Subject: Re: VIRTIO adoption in other hypervisors
In-Reply-To: <a64fd962-8b62-58d9-9fe3-cc2aa686ac02@siemens.com>
Message-ID: <alpine.DEB.2.21.2002281024490.3414@sstabellini-ThinkPad-T480s>
References: <87mu93vwy2.fsf@linaro.org>
 <db75fc2b-ac2e-2351-cc3c-cdb42a50ac24@siemens.com>
 <0b80da21-ed40-c550-c605-031a209115b1@siemens.com>
 <878skmwtei.fsf@linaro.org>
 <a64fd962-8b62-58d9-9fe3-cc2aa686ac02@siemens.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Wei Liu <liuw@liuw.name>, virtio-dev@lists.oasis-open.org,
 Stefano Stabellini <sstabellini@kernel.org>, jan.kiszka@siemens.com,
 virtualization@lists.linux-foundation.org
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

On Fri, 28 Feb 2020, Jan Kiszka wrote:
> > It seems to me any KVM-like run loop trivially supports a range of
> > virtio devices by virtue of trapping accesses to the signalling area of
> > a virtqueue and allowing the VMM to handle the transaction which ever
> > way it sees fit.
> > 
> > I've not quite understood the way Xen interfaces to QEMU aside from it's
> > different to everything else. More over it seems the type-1 hypervisors
> > are more interested in providing better isolation between segments of a
> > system whereas VIRTIO currently assumes either the VMM or the hypervisor
> > has full access the full guest address space. I've seen quite a lot of
> > slides that want to isolate sections of device emulation to separate
> > processes or even separate guest VMs.
> 
> The point is in fact not only whether to trap IO accesses or to ask the guest
> to rather target something like ivshmem (in fact, that is where use cases I
> have in mind deviated from those of that cloud operator). It is specifically
> the question how the backend should be able to transfer data to/from the
> frontend. If you want to isolate the both from each other (driver
> VMs/domains/etc.), you either need a complex virtual IOMMU (or "grant tables")
> or a static DMA windows (like ivshmem). The former is more efficient with
> large transfers, the latter is much simpler and therefore more robust.

Jan explained it well +1

In addition to what Jan wrote, which is the most important aspect,
there is also actually a problem with IO trapping with Xen x86 PV
guests, but I think today is far less important than it used to be. We
are talking about a type of guest designed to run without virtualization
support in hardware. Trapping is not easy in that case. Today, on x86 we
have PVH and HVM guests which use virtualization extensions. On ARM, all
guests always had hardware virtualization support from the start. So, as
of today, all guests except for old-style x86 PV guests can trap IO
accesses without issues. IO trapping comes into play when you want to
hook up something like the QEMU implementation of the PCI virtio
backends. In fact, that works today with x86 HVM guests, but not with
x86 PV guests. It doesn't work on ARM simply because Xen on ARM hasn't
been using a QEMU emulator for anything yet, but there is nothing
architectural that would prevent it from working. In fact, I have seen a
demo of an emulator running together with Xen on ARM at a conference.

(FYI today you can run OpenAMP RPMesg, which is virtio-based, between
two Xen guests by setting up pre-shared memory between them.)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
