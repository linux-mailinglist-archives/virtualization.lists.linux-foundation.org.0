Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 135971B308D
	for <lists.virtualization@lfdr.de>; Tue, 21 Apr 2020 21:40:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B6C8F20487;
	Tue, 21 Apr 2020 19:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHrYt60GJ64r; Tue, 21 Apr 2020 19:40:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F36182035B;
	Tue, 21 Apr 2020 19:40:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3BE8C0175;
	Tue, 21 Apr 2020 19:40:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 597A9C0175
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 19:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 46E7986CC0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 19:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U0q+CDl76Gc2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 19:40:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CF11986C02
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 19:40:20 +0000 (UTC)
Subject: Re: [GIT PULL v2] vhost: cleanups and fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587498020;
 bh=EdT/q7UFfZCJ31DJSxP12Wv8fYBVt6LXEKfaUOq3cKk=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=ksZauvLKnCWKE88mDN9PHb1ELnMSZjfAyUeR5AXARuo99zjbilN/ya1702AYdcM1l
 WFr/a4K6IQ49UcRqh/Y+GLb/yRqOITIctLlddEepYymYB8mQCCjoeW4qspaTJIsd8e
 6Q0kIG/VXukPYsyypOicpW6i97bM40fb+8l3dREU=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200420160001-mutt-send-email-mst@kernel.org>
References: <20200420160001-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200420160001-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: d085eb8ce727e581abf8145244eaa3339021be2f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 189522da8b3a796d56d802e067d591d2ffff7f40
Message-Id: <158749802063.25518.14503910452719540577.pr-tracker-bot@kernel.org>
Date: Tue, 21 Apr 2020 19:40:20 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: hulkci@huawei.com, arnd@arndb.de, kvm@vger.kernel.org,
 gustavo@embeddedor.com, netdev@vger.kernel.org, mst@redhat.com,
 yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 yanaijie@huawei.com, eli@mellanox.com, sfr@canb.auug.org.au,
 alexander.h.duyck@linux.intel.com, bjorn.andersson@linaro.org,
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

The pull request you sent on Mon, 20 Apr 2020 16:00:01 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/189522da8b3a796d56d802e067d591d2ffff7f40

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
