Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7982C9378
	for <lists.virtualization@lfdr.de>; Tue,  1 Dec 2020 01:00:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0149F872E7;
	Tue,  1 Dec 2020 00:00:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id maKOUAHm9iWD; Tue,  1 Dec 2020 00:00:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 35FAA8731F;
	Tue,  1 Dec 2020 00:00:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2143DC0052;
	Tue,  1 Dec 2020 00:00:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36140C0052
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 00:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2EFAC85F2F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 00:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYeFqD7Z7V80
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 00:00:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B29E785D97
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 00:00:01 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EAFC9206E9;
 Tue,  1 Dec 2020 00:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606780801;
 bh=ARbNMxYbl+0MjUA5JbZmKxOB1SM/D2f+eDOPe8frr3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QtieARJ47keURK5f5xizfArqb5i2FnWDPf/DVJozSlnaBRgOqU51coDazBIpwvEJl
 BgH8d7D80FB/t44qzSWeBu4HsgQ/lNcskRQ6hMARbXLpL4xfFxxSaWn3CZcs3Uhhwk
 jnQAnphvrUXRQy9/l8ovXhAs9k3uj7+k8k1hswTQ=
Date: Mon, 30 Nov 2020 18:59:59 -0500
From: Sasha Levin <sashal@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH AUTOSEL 5.9 22/33] vhost scsi: add lun parser helper
Message-ID: <20201130235959.GS643756@sasha-vm>
References: <20201125180102.GL643756@sasha-vm>
 <9670064e-793f-561e-b032-75b1ab5c9096@redhat.com>
 <20201129041314.GO643756@sasha-vm>
 <7a4c3d84-8ff7-abd9-7340-3a6d7c65cfa7@redhat.com>
 <20201129210650.GP643756@sasha-vm>
 <e499986d-ade5-23bd-7a04-fa5eb3f15a56@redhat.com>
 <20201130173832.GR643756@sasha-vm>
 <238cbdd1-dabc-d1c1-cff8-c9604a0c9b95@redhat.com>
 <9ec7dff6-d679-ce19-5e77-f7bcb5a63442@oracle.com>
 <4c1b2bc7-cf50-4dcd-bfd4-be07e515de2a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c1b2bc7-cf50-4dcd-bfd4-be07e515de2a@redhat.com>
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

On Mon, Nov 30, 2020 at 09:29:02PM +0100, Paolo Bonzini wrote:
>On 30/11/20 20:44, Mike Christie wrote:
>>I have never seen a public/open-source vhost-scsi testsuite.
>>
>>For patch 23 (the one that adds the lun reset support which is built on
>>patch 22), we can't add it to stable right now if you wanted to, because
>>it has a bug in it. Michael T, sent the fix:
>>
>>https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/commit/?h=linux-next&id=b4fffc177fad3c99ee049611a508ca9561bb6871
>>
>>to Linus today.
>
>Ok, so at least it was only a close call and anyway not for something 
>that most people would be running on their machines.  But it still 
>seems to me that the state of CI in Linux is abysmal compared to what 
>is needed to arbitrarily(*) pick up patches and commit them to 
>"stable" trees.
>
>Paolo
>
>(*) A ML bot is an arbitrary choice as far as we are concerned since 
>we cannot know how it makes a decision.

The choice of patches is "arbitrary", but the decision is human. The
patches are reviewed coming out of the AI, sent to public mailing
list(s) for review, followed by 2 reminders asking for reviews.

The process for AUTOSEL patches generally takes longer than most patches
do for upstream.

It's quite easy to NAK a patch too, just reply saying "no" and it'll be
dropped (just like this patch was dropped right after your first reply)
so the burden on maintainers is minimal.

-- 
Thanks,
Sasha
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
