Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB1724222B
	for <lists.virtualization@lfdr.de>; Tue, 11 Aug 2020 23:59:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F6E386049;
	Tue, 11 Aug 2020 21:59:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2wCNEBZifV3D; Tue, 11 Aug 2020 21:59:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 453D985EA5;
	Tue, 11 Aug 2020 21:59:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3505FC004D;
	Tue, 11 Aug 2020 21:59:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FA4BC004D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 21:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8B40785EA5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 21:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YPWpLoQ3MoVh
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 21:59:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F2F2485065
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 21:59:10 +0000 (UTC)
Subject: Re: [GIT PULL] virtio: features, fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597183150;
 bh=pduJdQOsaqltANr9l0iuMb/P8XQ2p94DV73pB5O3e3U=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=GthU30VIz6XaDDYj0LD8oG30goU0vf67f57r+Wl0jVapX3S60ZQ0lEtunpVsEZIdC
 2cUiR5/E6sy6zJbOlvN2b4ah+sxk3UAqCPKrGP/hv9VmRZ4J7DgP1XO6pCLDUdIeV+
 NrwmGYHf5kDH9jSY8ViGXW2i3EgZKJYynkcDyXuY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200811045613-mutt-send-email-mst@kernel.org>
References: <20200811045613-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <kvm.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200811045613-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: 8a7c3213db068135e816a6a517157de6443290d6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 57b077939287835b9396a1c3b40d35609cf2fcb8
Message-Id: <159718315071.19600.5549149981954786665.pr-tracker-bot@kernel.org>
Date: Tue, 11 Aug 2020 21:59:10 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: kvm@vger.kernel.org, michaelgur@mellanox.com, linux-kernel@vger.kernel.org,
 meirl@mellanox.com, eli@mellanox.com, maxg@mellanox.com, elic@nvidia.com,
 maorg@mellanox.com, liao.pingfang@zte.com.cn, lkp@intel.com, lulu@redhat.com,
 rong.a.chen@intel.com, mst@redhat.com, saeedm@mellanox.com,
 andy.shevchenko@gmail.com, dan.carpenter@oracle.com, wang.yi59@zte.com.cn,
 parav@mellanox.com, leonro@mellanox.com, wenan.mao@linux.alibaba.com,
 alex.dewar@gmx.co.uk, virtualization@lists.linux-foundation.org,
 netdev@vger.kernel.org, cohuck@redhat.com, gustavoars@kernel.org,
 stable@vger.kernel.org, vgoyal@redhat.com, colin.king@canonical.com,
 lingshan.zhu@intel.com, Linus Torvalds <torvalds@linux-foundation.org>,
 tariqt@mellanox.com
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

The pull request you sent on Tue, 11 Aug 2020 04:56:13 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/57b077939287835b9396a1c3b40d35609cf2fcb8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
