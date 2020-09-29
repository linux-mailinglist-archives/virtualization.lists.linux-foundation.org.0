Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B82827D4B0
	for <lists.virtualization@lfdr.de>; Tue, 29 Sep 2020 19:44:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 09EB22040B;
	Tue, 29 Sep 2020 17:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1dXipCPwTVh1; Tue, 29 Sep 2020 17:44:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4B71E2034C;
	Tue, 29 Sep 2020 17:44:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09843C016F;
	Tue, 29 Sep 2020 17:44:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 889FAC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 17:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7703484D8E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 17:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kSK713uxR8Qg
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 17:44:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0227785BCE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 17:44:08 +0000 (UTC)
Subject: Re: [GIT PULL] virtio: last minute fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601401448;
 bh=03GvkImuXPeydQHobuE6Tvmyjh05QhbS/bF0LvHvOSc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=G1KlPn+A/P/OU48SFCU8AEqmnPajLsFfhy1vgH9tcYTF/orapMWS7+W5rGhKLlyDo
 i6RB1ZK04Ruxyb43bA+Kncn8jtrlM0mDAptVpEMbru1opGXBVUugo8pgX/c3khMD+H
 117IDBtyd2RGXfYmI0Ne3L1H8GCJbKFEskM76cfQ=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200929035034-mutt-send-email-mst@kernel.org>
References: <20200929035034-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: Linux virtualization
 <virtualization.lists.linux-foundation.org>
X-PR-Tracked-Message-Id: <20200929035034-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: a127c5bbb6a8eee851cbdec254424c480b8edd75
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1ccfa66d94cf65d3e89eeb95676a03e8f90edd99
Message-Id: <160140144806.29614.17781182961923244998.pr-tracker-bot@kernel.org>
Date: Tue, 29 Sep 2020 17:44:08 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eli@mellanox.com, elic@nvidia.com,
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

The pull request you sent on Tue, 29 Sep 2020 03:50:34 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1ccfa66d94cf65d3e89eeb95676a03e8f90edd99

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
