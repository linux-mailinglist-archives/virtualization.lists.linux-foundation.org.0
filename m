Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B293749A4
	for <lists.virtualization@lfdr.de>; Wed,  5 May 2021 22:49:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E27634058A;
	Wed,  5 May 2021 20:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id POJQc2KdkYtO; Wed,  5 May 2021 20:49:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 858C140599;
	Wed,  5 May 2021 20:49:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21876C0001;
	Wed,  5 May 2021 20:49:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EDBC9C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 May 2021 20:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E162082BBD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 May 2021 20:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CC1OcIdNNEeg
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 May 2021 20:49:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C7C882AAA
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 May 2021 20:49:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B2405613BA;
 Wed,  5 May 2021 20:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620247755;
 bh=fIBnzCoLd7WFpaxwVmmrRv7I6zOzGgD4l9SQolYykqw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=SGV+dXVMsmxu7ZS5APC452PYA81R0UlZ9lE8ZEgbaJ4JzcKvWsTEaH3GEWKyOO23v
 94NvIGUiXFq0Z2rV7lPpFGnwXkOkCIqZK7fsfOOgnixrW81XOR1LC5agd2nM6DEHFp
 MSY7iCrQ+iszzeH7lsCUhbVUfW0QLEGHrN1hI99l+FnTY8Px2ytmrVLQ+lf8OO/xXl
 E3azMDLxbPkbF4onk5bfVoyR2VDdbgfc++jQBH2PCw/Lj2J78iCvM6pwmZ+g6g78XL
 yfoignsYM3122879hHRGG0lsZX8Xt5o+injOhz8nLSM58maLJqfDjl7V1k6FH+3tzI
 7hRJgze6IrDFA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9CF59609E8;
 Wed,  5 May 2021 20:49:15 +0000 (UTC)
Subject: Re: [GIT PULL] virtio,vhost,vdpa: features, fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210505161135-mutt-send-email-mst@kernel.org>
References: <20210505161135-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <kvm.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210505161135-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: d7bce85aa7b92b5de8f69b3bcedfe51d7b1aabe1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 16bb86b5569cb7489367101f6ed69b25682b47db
Message-Id: <162024775557.12235.13272630963086835800.pr-tracker-bot@kernel.org>
Date: Wed, 05 May 2021 20:49:15 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: mgurtovoy@nvidia.com, lkp@intel.com, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, xieyongji@bytedance.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 liu.xiang@zlingsmart.com, elic@nvidia.com,
 Linus Torvalds <torvalds@linux-foundation.org>, lingshan.zhu@intel.com
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

The pull request you sent on Wed, 5 May 2021 16:11:35 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/16bb86b5569cb7489367101f6ed69b25682b47db

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
