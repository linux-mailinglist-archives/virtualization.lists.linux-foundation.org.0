Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A8C1A2E25
	for <lists.virtualization@lfdr.de>; Thu,  9 Apr 2020 06:05:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D730584ADC;
	Thu,  9 Apr 2020 04:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZyZV9czorhcO; Thu,  9 Apr 2020 04:05:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 74376848BE;
	Thu,  9 Apr 2020 04:05:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61013C0177;
	Thu,  9 Apr 2020 04:05:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19BECC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 04:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F3BD78698E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 04:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3v-55VCTJINZ
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 04:05:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6F52D86988
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 04:05:25 +0000 (UTC)
Subject: Re: [GIT PULL] vhost: fixes, vdpa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586405125;
 bh=xXKU+vo8zx0ukwRuksAohJp2Z+Nfi2jcadpfaRnvV2E=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=ZfdVDZPewcVPexmajh1trV4EH2g0schk8vx7bplfikfvnKqKFQR9TCf34g5Ra71Jt
 4mAHrAOG+EUwZ8EPfvFJQin9KOqt/o+v+lqo5SrbGPCgx7CWUHuswMklFVVsaSvH9S
 cjJ0R3h7yZQevwRuDkCFhxcyq6ZpQaTqMwDCt+vg=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200406171124-mutt-send-email-mst@kernel.org>
References: <20200406171124-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200406171124-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: c9b9f5f8c0f3cdb893cb86c168cdaa3aa5ed7278
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 835a6a649d0dd1b1f46759eb60fff2f63ed253a7
Message-Id: <158640512513.12302.5687148234965008608.pr-tracker-bot@kernel.org>
Date: Thu, 09 Apr 2020 04:05:25 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: rdunlap@infradead.org, tiwei.bie@intel.com, kvm@vger.kernel.org,
 netdev@vger.kernel.org, mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, tysand@google.com,
 eperezma@redhat.com, xiao.w.wang@intel.com, namit@vmware.com,
 rientjes@google.com, yuri.benditovich@daynix.com,
 alexander.h.duyck@linux.intel.com, mhocko@kernel.org,
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

The pull request you sent on Mon, 6 Apr 2020 17:11:24 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/835a6a649d0dd1b1f46759eb60fff2f63ed253a7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
