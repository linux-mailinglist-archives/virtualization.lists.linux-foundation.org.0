Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9703E2C8B58
	for <lists.virtualization@lfdr.de>; Mon, 30 Nov 2020 18:38:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id ECC9222E89;
	Mon, 30 Nov 2020 17:38:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZtbXpIlTbsy; Mon, 30 Nov 2020 17:38:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C372922D33;
	Mon, 30 Nov 2020 17:38:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E115C0052;
	Mon, 30 Nov 2020 17:38:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7BEBC0052
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 17:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A403A87289
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 17:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nxc46i0yEV0r
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 17:38:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4124D87274
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 17:38:34 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5EB02206DF;
 Mon, 30 Nov 2020 17:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606757913;
 bh=HFFjE9XmgSSYVer9/aKugIZ6a6/sln2JoPbC+j0PUD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J8EVOor3Z/1QL0gF/GLTYCJqXzHEzoF/l+jyxZ9BfaFOAJoHzWvOOisIDGTcn3q/g
 phDt6DHOyqNWDt4rpr4f04fx1qNrd8hOyEG2KO18yGM6hKJdN8u9vLkQ6yhfcStZWc
 umau9hTezF1Hr/jTOaC0vv7PsApzQsyAKP7j1gEw=
Date: Mon, 30 Nov 2020 12:38:32 -0500
From: Sasha Levin <sashal@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH AUTOSEL 5.9 22/33] vhost scsi: add lun parser helper
Message-ID: <20201130173832.GR643756@sasha-vm>
References: <20201125153550.810101-1-sashal@kernel.org>
 <20201125153550.810101-22-sashal@kernel.org>
 <25cd0d64-bffc-9506-c148-11583fed897c@redhat.com>
 <20201125180102.GL643756@sasha-vm>
 <9670064e-793f-561e-b032-75b1ab5c9096@redhat.com>
 <20201129041314.GO643756@sasha-vm>
 <7a4c3d84-8ff7-abd9-7340-3a6d7c65cfa7@redhat.com>
 <20201129210650.GP643756@sasha-vm>
 <e499986d-ade5-23bd-7a04-fa5eb3f15a56@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e499986d-ade5-23bd-7a04-fa5eb3f15a56@redhat.com>
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Mike Christie <michael.christie@oracle.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Mon, Nov 30, 2020 at 09:33:46AM +0100, Paolo Bonzini wrote:
>On 29/11/20 22:06, Sasha Levin wrote:
>>Plus all the testing we have for the stable trees, yes. It goes beyond
>>just compiling at this point.
>>
>>Your very own co-workers (https://cki-project.org/) are pushing hard on
>>this effort around stable kernel testing, and statements like these
>>aren't helping anyone.
>
>I am not aware of any public CI being done _at all_ done on 
>vhost-scsi, by CKI or everyone else.  So autoselection should be done 
>only on subsystems that have very high coverage in CI.

Where can I find a testsuite for virtio/vhost? I see one for KVM, but
where is the one that the maintainers of virtio/vhost run on patches
that come in?

-- 
Thanks,
Sasha
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
