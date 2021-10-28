Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D2D43E74B
	for <lists.virtualization@lfdr.de>; Thu, 28 Oct 2021 19:25:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B17B607CF;
	Thu, 28 Oct 2021 17:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wz5XJZSsnl4t; Thu, 28 Oct 2021 17:25:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 58DDC607F9;
	Thu, 28 Oct 2021 17:25:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF555C000E;
	Thu, 28 Oct 2021 17:25:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD8ABC000E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 17:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9430540124
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 17:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryT7PaRM8HO3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 17:25:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3AA9400D8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 17:25:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 50C3E60C40;
 Thu, 28 Oct 2021 17:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635441928;
 bh=zUb4Gzz37GpbFqY7ZqohiEI/HBvNyHCiwsAMcYZ9fSI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=NAK2Z83brbtImMs6OspSndZ1LKJiBdX32HAzP/KMhDEsVOgYpYbiPMRmoUES4FGUv
 3CTID0hv8Ijl9T5GczXyk29OEfTc6ZpKvoo8BLfC6GOnVvXv6GwSF9qFnmCZm2NJ4o
 TsGgU4JqXFVF4iWoNMMJ+mDGHaA5mXItOl8y84XeuP0+9BWtdPMxF5PUPr4fNh8ABB
 1Mven7gnZxf15JTSWCArMIpa98Sdih0VTAbUDnALXd0CTqO03lnbx/rUjlrRBrbMsK
 FyT3GU4q39W9F1hHJKkJ6puo0LYtVpCxZtNJBJ1QqOmciNNy+Xl0+lZWsHzU22BPjm
 NkLgjmErcD/3Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 40658609D2;
 Thu, 28 Oct 2021 17:25:28 +0000 (UTC)
Subject: Re: [GIT PULL] virtio: last minute fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20211027160829-mutt-send-email-mst@kernel.org>
References: <20211027160829-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211027160829-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: 890d33561337ffeba0d8ba42517e71288cfee2b6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9c5456773d79b64cc6cebb06f668e29249636ba9
Message-Id: <163544192820.14282.4874283985914408651.pr-tracker-bot@kernel.org>
Date: Thu, 28 Oct 2021 17:25:28 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 vincent.whitchurch@axis.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xieyongji@bytedance.com,
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

The pull request you sent on Wed, 27 Oct 2021 16:08:29 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9c5456773d79b64cc6cebb06f668e29249636ba9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
