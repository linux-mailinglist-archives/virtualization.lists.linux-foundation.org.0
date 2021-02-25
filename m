Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 752343257A0
	for <lists.virtualization@lfdr.de>; Thu, 25 Feb 2021 21:29:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51D8B430B0;
	Thu, 25 Feb 2021 20:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MS5EbJKXxQlG; Thu, 25 Feb 2021 20:29:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E4E0432A1;
	Thu, 25 Feb 2021 20:29:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7320C0001;
	Thu, 25 Feb 2021 20:29:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0A33C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Feb 2021 20:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9164B83B85
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Feb 2021 20:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hEwsMk6lqTur
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Feb 2021 20:29:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D896683B6B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Feb 2021 20:29:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 56FF964F32;
 Thu, 25 Feb 2021 20:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614284990;
 bh=fmzexBSIfWb47JkIPrZNPmcrb7SH3FBEATmvFBYUfD0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=oqcux6qN0uI6LifZYaDpDyY+9BABnFbWj1andck/5elvftav0Kj99uVq2h7CUO+XE
 2VjXZrPkpo8h7+fxHDUlec+DQ2iZzhvivH66DSJeE/c2mkFFdS96Y+hzOlithb4fz2
 YFScToiuY6SoaSPSTcYdLvwttH5sK7XnuxhAHckVIyvW2xgA0tjCvch9XMFxDv2UL4
 f9lmwLr5U8Q/MLov0iaOzWfyvaQpyc9sYxa4GCN3q3d9CQheiAGaVv3ZCrwr6PktSG
 /DghOU+/gxQ6rkyq+b9M1n6KWCTmOkYb5WfN6sWhUu6lma3U5e5j39icHy9pMJumlF
 r8vBrjtWAEdag==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 43F59609F5;
 Thu, 25 Feb 2021 20:29:50 +0000 (UTC)
Subject: Re: [GIT PULL] virtio: features, fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210225143333-mutt-send-email-mst@kernel.org>
References: <20210225143333-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210225143333-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: 16c10bede8b3d8594279752bf53153491f3f944f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ffc1759676bed0bff046427dd7d00cb68660190d
Message-Id: <161428499022.20173.13248373429390310648.pr-tracker-bot@kernel.org>
Date: Thu, 25 Feb 2021 20:29:50 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: xianting_tian@126.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 joseph.qi@linux.alibaba.com, edumazet@google.com, elic@nvidia.com,
 anders.roxell@linaro.org, naresh.kamboju@linaro.org, mst@redhat.com,
 joe.jin@oracle.com, virtualization@lists.linux-foundation.org,
 linux@roeck-us.net, aruna.ramakrishna@oracle.com,
 vasyl.vavrychuk@opensynergy.com, arnd@arndb.de, abaci@linux.alibaba.com,
 syzkaller@googlegroups.com, abaci-bugfix@linux.alibaba.com,
 netdev@vger.kernel.org, gustavoars@kernel.org, stable@vger.kernel.org,
 mathias.crombez@faurecia.com, tiantao6@hisilicon.com,
 Linus Torvalds <torvalds@linux-foundation.org>
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

The pull request you sent on Thu, 25 Feb 2021 14:33:33 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ffc1759676bed0bff046427dd7d00cb68660190d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
