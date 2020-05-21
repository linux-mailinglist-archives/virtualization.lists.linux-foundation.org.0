Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C01001DD8F4
	for <lists.virtualization@lfdr.de>; Thu, 21 May 2020 22:55:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 647C287565;
	Thu, 21 May 2020 20:55:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pwx5FX7L3Btl; Thu, 21 May 2020 20:55:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ED42C87511;
	Thu, 21 May 2020 20:55:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5174C0176;
	Thu, 21 May 2020 20:55:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB881C0176
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 May 2020 20:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BBC0020521
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 May 2020 20:55:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vzt+iNZlEslK
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 May 2020 20:55:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 317092040D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 May 2020 20:55:04 +0000 (UTC)
Subject: Re: [GIT PULL] vhost/vdpa: minor fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590094503;
 bh=+/719HmcyCCId615mpvh5nFpL+AjayClp/EMvyvl+hY=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=adFr5lHvsH3c/p6knnuwnihJODjKWPY4IxfYpgEwjSzL+/T7Juid2L93wtgVUvZQn
 OqwFRwhzpSa9YhuPpHK2e8d73gKjwz6z8MHtrSQABaIHd5mJAP43tiopR/uxpLN/Lk
 iGu3a7aXCSiGfYveFFLNMzWKxC3zlYibxRuRs4Qw=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200521140835-mutt-send-email-mst@kernel.org>
References: <20200521140835-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200521140835-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: 1b0be99f1a426d9f17ced95c4118c6641a2ff13d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d2f8825ab78e4c18686f3e1a756a30255bb00bf3
Message-Id: <159009450386.9071.3699018741484442265.pr-tracker-bot@kernel.org>
Date: Thu, 21 May 2020 20:55:03 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: lkp@intel.com, kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
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

The pull request you sent on Thu, 21 May 2020 14:08:35 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d2f8825ab78e4c18686f3e1a756a30255bb00bf3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
