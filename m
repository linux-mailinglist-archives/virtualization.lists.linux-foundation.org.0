Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 136DB3C2981
	for <lists.virtualization@lfdr.de>; Fri,  9 Jul 2021 21:20:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E9F16065A;
	Fri,  9 Jul 2021 19:20:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vwlCHhqeIDCP; Fri,  9 Jul 2021 19:20:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5F78460612;
	Fri,  9 Jul 2021 19:20:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF5EAC000E;
	Fri,  9 Jul 2021 19:20:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75DA0C000E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Jul 2021 19:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ED9583D5D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Jul 2021 19:20:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6G9UCopMHjaj
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Jul 2021 19:20:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE5BF83D4C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Jul 2021 19:20:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 536D8613C9;
 Fri,  9 Jul 2021 19:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625858439;
 bh=Fp+eQsJFd6B8DxNrmeN1/cJIyLa708u/+iW69f5n2FE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Fr7FmdfDTMlRwiy4ykC7xGQ/x7p8dFeFgfok3FCmFTMrgQNAygFgYXLuJ+jTADCkz
 XeMcLTdQ5pRUtGsUhEjS3X+3rvgC1SAuWvE6iJvYfpnEOgKYwBy87SZ9/fHhtIrc73
 DhNQtlpUaxbgYYJTWiQDaaA/FdL/lYhaIK1fikkuW2mDmVH/6se6L2QX0/oExAEqPi
 qdjFSH/i4qNTpFz0+vMfppnwXPHk2+3UFkPUkVESGyi+KgVnz4dTV/DmKNrpq2FwTh
 O7qvU0e0kKCnRMhh6xPGhYMXN6BcHnPsb/2VT5Ae6eVt/UwRAHYdQjgI0/TKkIptiL
 PN7fzkrCjjk4A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4AB2C609CD;
 Fri,  9 Jul 2021 19:20:39 +0000 (UTC)
Subject: Re: [GIT PULL] virtio,vhost,vdpa: features, fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210709071952-mutt-send-email-mst@kernel.org>
References: <20210709071952-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210709071952-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: db7b337709a15d33cc5e901d2ee35d3bb3e42b2f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1eb8df18677d197d7538583823c373d7f13cbebc
Message-Id: <162585843929.13664.10113139479114516329.pr-tracker-bot@kernel.org>
Date: Fri, 09 Jul 2021 19:20:39 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: sohaib.amhmd@gmail.com, lkp@intel.com, kvm@vger.kernel.org,
 netdev@vger.kernel.org, mst@redhat.com, abaci@linux.alibaba.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 zhangshaokun@hisilicon.com, xieyongji@bytedance.com,
 yang.lee@linux.alibaba.com, stefanha@redhat.com, wanjiabing@vivo.com,
 elic@nvidia.com, Linus Torvalds <torvalds@linux-foundation.org>,
 lingshan.zhu@intel.com, dan.carpenter@oracle.com
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

The pull request you sent on Fri, 9 Jul 2021 07:19:52 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1eb8df18677d197d7538583823c373d7f13cbebc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
