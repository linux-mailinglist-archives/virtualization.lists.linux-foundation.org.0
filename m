Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F37A61F5DCD
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 23:45:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 69AA52575D;
	Wed, 10 Jun 2020 21:45:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zyEjcoqY03+O; Wed, 10 Jun 2020 21:45:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E4499258AC;
	Wed, 10 Jun 2020 21:45:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2988C016F;
	Wed, 10 Jun 2020 21:45:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D92D4C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 21:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BF8B488334
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 21:45:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v8xcQ9UtZ1lj
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 21:45:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 406AF882C7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 21:45:23 +0000 (UTC)
Subject: Re: [GIT PULL] virtio: features, fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591825522;
 bh=CE0aQdpou0/7Squu8lBaWHAf5wRg1NIwqMRssSM2m5Y=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=uwOfHFMudzPjx89JIxmzIihgrvNSZb8E5Y8VJPcl62MOMXz9JENAI7SwNDlcZT/Xu
 SmsVNXCaYo4WTWgoOLs/nwK6d09/7X0uH5LMptEpaEyf2jR+uRf2bq+4UInSqLu7Ke
 I+DUqB2wDcqbwMkgYQwYOqT59zhr0XsLAY6Enz8I=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200610004455-mutt-send-email-mst@kernel.org>
References: <20200610004455-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200610004455-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: 044e4b09223039e571e6ec540e25552054208765
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 09102704c67457c6cdea6c0394c34843484a852c
Message-Id: <159182552257.4867.17502702352097264992.pr-tracker-bot@kernel.org>
Date: Wed, 10 Jun 2020 21:45:22 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: osalvador@suse.com, mhocko@suse.com, kvm@vger.kernel.org,
 kernelfans@gmail.com, virtualization@lists.linux-foundation.org,
 glider@google.com, teawaterz@linux.alibaba.com,
 alexander.h.duyck@linux.intel.com, elfring@users.sourceforge.net,
 herbert@gondor.apana.org.au, zou_wei@huawei.com, linux-acpi@vger.kernel.org,
 konrad.wilk@oracle.com, rppt@linux.ibm.com, hulkci@huawei.com,
 richard.weiyang@gmail.com, clabbe@baylibre.com, anthony.yznaga@oracle.com,
 longpeng2@huawei.com, osalvador@suse.de, dyoung@redhat.com, lenb@kernel.org,
 pavel.tatashin@microsoft.com, pasha.tatashin@soleen.com,
 anshuman.khandual@arm.com, gregkh@linuxfoundation.org, cai@lca.pw,
 stefanha@redhat.com, dan.j.williams@intel.com, mhocko@kernel.org,
 lingshan.zhu@intel.com, vbabka@suse.cz, lkp@intel.com, jgross@suse.com,
 pankaj.gupta.linux@gmail.com, mgorman@techsingularity.net,
 netdev@vger.kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, matej.genci@nutanix.com, mst@redhat.com,
 hannes@cmpxchg.org, rafael@kernel.org, imammedo@redhat.com,
 akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
 davem@davemloft.net
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

The pull request you sent on Wed, 10 Jun 2020 00:44:55 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/09102704c67457c6cdea6c0394c34843484a852c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
