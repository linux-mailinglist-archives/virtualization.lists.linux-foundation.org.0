Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFF62CC840
	for <lists.virtualization@lfdr.de>; Wed,  2 Dec 2020 21:48:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C55E086ECB;
	Wed,  2 Dec 2020 20:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FE2FgRCBkrMd; Wed,  2 Dec 2020 20:48:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DC9DF86E8A;
	Wed,  2 Dec 2020 20:48:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B80DCC0052;
	Wed,  2 Dec 2020 20:48:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A31A2C0052
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 20:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 78CA8203A7
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 20:48:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DTGsZprmwCkU
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 20:48:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id E249A2036E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 20:48:35 +0000 (UTC)
Subject: Re: [GIT PULL] vdpa: last minute bugfixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1606942113;
 bh=Pfal5eZHb3G2KKSiwL+xk4HK/vWCqBVH2HiQl3Y7Bnw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=GIJbhoSgwSrDVO8gN/q7DdNyv+3y2WmmotTi9dLx7ITg47CY/Z1CFeXepmb9u2mra
 r7HtzDNMascxpqVuXomN2igH4zLdyx9GS36qGqNnF1+jyigR3LFRGYA+1hGZwEIEzz
 E5Ytt8h/Akm/Am1L0+rw1Y/bOJ+nFNl1Y5UCFfNZLnlaVXM9kuf7d3N//6DlAjwAc2
 k6jSZK0yOWoLkeuJJqcczDrL2ISy1y9/AuypWQbMSUoP+OlN3XyG5hiptQ1lcdjYdM
 VIyydKcS4kYEgJu/UYDrZIhZvDFOLe040NDGFkx+v7rfr/KREZnYs+5gNa2wczoe9y
 jxI1KFY2U+/tg==
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201202065147-mutt-send-email-mst@kernel.org>
References: <20201202065147-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <kvm.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201202065147-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: 2c602741b51daa12f8457f222ce9ce9c4825d067
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2c6ffa9e9b11bdfa267fe05ad1e98d3491b4224f
Message-Id: <160694211318.5087.448562250965611321.pr-tracker-bot@kernel.org>
Date: Wed, 02 Dec 2020 20:48:33 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: lkp@intel.com, kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 rdunlap@infradead.org, leonro@nvidia.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eli@mellanox.com,
 Linus Torvalds <torvalds@linux-foundation.org>, saeedm@nvidia.com,
 dan.carpenter@oracle.com, parav@mellanox.com
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

The pull request you sent on Wed, 2 Dec 2020 06:51:47 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2c6ffa9e9b11bdfa267fe05ad1e98d3491b4224f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
