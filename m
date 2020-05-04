Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B3A1C460A
	for <lists.virtualization@lfdr.de>; Mon,  4 May 2020 20:35:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9978123335;
	Mon,  4 May 2020 18:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2r1WrsrvTBOr; Mon,  4 May 2020 18:35:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EE66E203F4;
	Mon,  4 May 2020 18:35:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D69E9C088F;
	Mon,  4 May 2020 18:35:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D2C6C0175
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 18:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 33CFC87AC5
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 18:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LSGLXr1khumi
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 18:35:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 711B688793
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 18:35:05 +0000 (UTC)
Subject: Re: [GIT PULL] vhost: fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588617305;
 bh=y7Pu1FubvJ8XEaBkpZaNRpWFQQvvFrFooiqYxgdFwlI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=o0+z+lEgyX0XO0M7qlk60y8gvXxm+B6YVhwMNbOooUgwauzhVMCt/iHrM/8Us84/I
 NQq+6lH48j3BGusVJfeNnvuYfBB5Hh356hYbLBSr3dG7hdxtouET22MjN64Tcun/cw
 79y9gGmTovRi2prymYxytR1uEJmUKeN4JuEGaWJ4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200504081540-mutt-send-email-mst@kernel.org>
References: <20200504081540-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200504081540-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: 0b841030625cde5f784dd62aec72d6a766faae70
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a16a47e98a30ae6a424d30ce9f4f99e4d9384713
Message-Id: <158861730512.3296.10840791650276451054.pr-tracker-bot@kernel.org>
Date: Mon, 04 May 2020 18:35:05 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: n.b@live.com, justin.he@arm.com, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, ldigby@redhat.com,
 stefanha@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>
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

The pull request you sent on Mon, 4 May 2020 08:15:40 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a16a47e98a30ae6a424d30ce9f4f99e4d9384713

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
