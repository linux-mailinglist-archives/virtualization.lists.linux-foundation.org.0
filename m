Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FEF1080BA
	for <lists.virtualization@lfdr.de>; Sat, 23 Nov 2019 22:10:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 22C568655C;
	Sat, 23 Nov 2019 21:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPz0ml9E9PZt; Sat, 23 Nov 2019 21:10:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9725386549;
	Sat, 23 Nov 2019 21:10:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B19FC087F;
	Sat, 23 Nov 2019 21:10:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E80B1C087F
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Nov 2019 21:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D0E402038A
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Nov 2019 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8yn76s+qECR8
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Nov 2019 21:10:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 4575C20360
 for <virtualization@lists.linux-foundation.org>;
 Sat, 23 Nov 2019 21:10:04 +0000 (UTC)
Subject: Re: [PULL] virtio: last minute bugfixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574543404;
 bh=tPLd1xVP7HkeCNRMMZFLexLDaHyo3UVyGY7DeCnDV/U=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=W5UIl7bsRlUUmcch1NKirmYya0Vld2PXT2Lv4WMByRSawXZ61a1uTroR+fknfZWPR
 HQxQW6vWxZi5iX2LXyp+rxaAG+JHXuJMhM4NraNACEwGiHliHCjc1PlxhO2OF8FTSq
 /g6ki+pJy19kgKir9X2RfVXulxvN6dErpdjags80=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191123115552-mutt-send-email-mst@kernel.org>
References: <20191123115552-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191123115552-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: c9a6820fc0da2603be3054ee7590eb9f350508a7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6b8a794678763130b7e7d049985008641dc494e8
Message-Id: <157454340405.11312.14684199337068886948.pr-tracker-bot@kernel.org>
Date: Sat, 23 Nov 2019 21:10:04 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: lvivier@redhat.com, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, khazhy@google.com,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 mimu@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>
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

The pull request you sent on Sat, 23 Nov 2019 11:55:52 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6b8a794678763130b7e7d049985008641dc494e8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
