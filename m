Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD5F2E28E1
	for <lists.virtualization@lfdr.de>; Thu, 24 Dec 2020 22:59:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B6F73873E1;
	Thu, 24 Dec 2020 21:59:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4F7vtCpkZt0q; Thu, 24 Dec 2020 21:59:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 463E8873D6;
	Thu, 24 Dec 2020 21:59:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BBABC1825;
	Thu, 24 Dec 2020 21:59:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45A6EC0893
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 21:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 32AA2873CC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 21:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NaE8feL1w76s
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 21:59:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A81D1873CB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 21:59:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4553022AED;
 Thu, 24 Dec 2020 21:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608847171;
 bh=57XCp+HRxi/jkyLBws5d5+r5kabghPGmjpfApkrGQy4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=HL2LOgzE347X2+IxZT0fYzkcnArzEWkvA28TmsIO6NpiEvq4Hut7iTyidOWtsIp4M
 5UjKMNqTBDp/wClTvZ07DRevAdY3q6L2Usdpkq5C/yPb+MFOzXaS1ZhVbr1ERimxnr
 UMb1JKMdpFTfO8LJFEflRm3phUQRNjlOHvtke0x2yfD6Ll9sYrSdnNhtqsuvN6LFyk
 VJcLEufJSdpREQEyVPSfp/ioLtPKT8hyiRVSRAoeWpKIfb9vp3ocejOxKo4SLNyAM4
 VWkN7dB/KHNZYf6OfySA0H6WJM9YmaF4+Av0atjfa+DbnMV2x1tBGymwWbuHh0FUxZ
 evHHQrFforjWw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 369C7604E9;
 Thu, 24 Dec 2020 21:59:31 +0000 (UTC)
Subject: Re: [GIT PULL] virtio,vdpa: features, cleanups, fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201223072448-mutt-send-email-mst@kernel.org>
References: <20201223072448-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <kvm.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201223072448-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: 418eddef050d5f6393c303a94e3173847ab85466
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 64145482d3339d71f58857591d021588040543f4
Message-Id: <160884717121.31605.12367248989541455981.pr-tracker-bot@kernel.org>
Date: Thu, 24 Dec 2020 21:59:31 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: peng.fan@nxp.com, richard.weiyang@linux.alibaba.com, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, zhangchangzhong@huawei.com,
 elic@nvidia.com, file@sect.tu-berlin.de, robert.buhren@sect.tu-berlin.de,
 mst@redhat.com, hulkci@huawei.com, dan.carpenter@oracle.com,
 christophe.jaillet@wanadoo.fr, tiantao6@hisilicon.com, mhocko@kernel.org,
 osalvador@suse.de, mgurtovoy@nvidia.com, pankaj.gupta.linux@gmail.com,
 netdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, info@metux.net
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

The pull request you sent on Wed, 23 Dec 2020 07:24:48 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/64145482d3339d71f58857591d021588040543f4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
