Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8212A1ADD
	for <lists.virtualization@lfdr.de>; Sat, 31 Oct 2020 22:45:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 83F8686D8D;
	Sat, 31 Oct 2020 21:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1YboOwM_q9yP; Sat, 31 Oct 2020 21:45:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2F70A86D4D;
	Sat, 31 Oct 2020 21:45:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED81AC0051;
	Sat, 31 Oct 2020 21:45:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08576C0051
 for <virtualization@lists.linux-foundation.org>;
 Sat, 31 Oct 2020 21:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DFDB8204ED
 for <virtualization@lists.linux-foundation.org>;
 Sat, 31 Oct 2020 21:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3s3HYaEpTPRj
 for <virtualization@lists.linux-foundation.org>;
 Sat, 31 Oct 2020 21:45:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 4A59320353
 for <virtualization@lists.linux-foundation.org>;
 Sat, 31 Oct 2020 21:45:53 +0000 (UTC)
Subject: Re: [GIT PULL] vhost,vdpa: fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604180753;
 bh=K1pHC+h1KmbMEQrr0pjOapUULKG871SA5i/eGG5pEnA=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=e3a3E3ALw7FxGXqXJf9uLhhvh28wO9qKWyyXoHJY1JhuEcINp0Ozlls0gutouAxxj
 EQinLecNxQRfQta/7NdOdEoj2m4CjjveGfNKUbvBEnunf0jEHqnjcjezpswCJJBDx0
 x892mviiUhRBq7mwbx/jZBrizaycQPVj/q98Rt6g=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201031155940-mutt-send-email-mst@kernel.org>
References: <20201031155940-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <netdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201031155940-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: 0c86d774883fa17e7c81b0c8838b88d06c2c911e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c2dc4c073fb71b50904493657a7622b481b346e3
Message-Id: <160418075297.5586.994529741826670733.pr-tracker-bot@kernel.org>
Date: Sat, 31 Oct 2020 21:45:52 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: lvivier@redhat.com, lkp@intel.com, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, elic@nvidia.com,
 jingxiangfeng@huawei.com, Linus Torvalds <torvalds@linux-foundation.org>,
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

The pull request you sent on Sat, 31 Oct 2020 15:59:40 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c2dc4c073fb71b50904493657a7622b481b346e3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
