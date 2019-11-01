Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E49B6EC92E
	for <lists.virtualization@lfdr.de>; Fri,  1 Nov 2019 20:40:13 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ACE7B1016;
	Fri,  1 Nov 2019 19:40:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 348F9FE8
	for <virtualization@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 19:40:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E560A466
	for <virtualization@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 19:40:04 +0000 (UTC)
Subject: Re: [PULL RESEND] virtio: fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572637204;
	bh=4s8kkFjDHSBB9ziGWMKgy53QMczI/E5GrCnwYN/RUyQ=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=hB34jki1umUDR2s6uEc4UODACvC5P/wxEjErnSCcnv+kG75P0sltDXREUoXP+Sefz
	D0sz838gEl1QZtVZfEHzUHN9xbMOq9w8IVOsMTW8AsrdUAj7ib3S2XY0m83M/vsOwb
	8qMcTc7pgBB/onqN4gy6H26RvZbpUXIpSI90CLLY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191028042900-1-mutt-send-email-mst@kernel.org>
References: <20191028042900-1-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191028042900-1-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git
	tags/for_linus
X-PR-Tracked-Commit-Id: b3683dee840274e9997d958b9d82e5de95950f0b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9e5eefba3d098d66defa1ce59a34a41a96f49771
Message-Id: <157263720474.9839.17625724873379326376.pr-tracker-bot@kernel.org>
Date: Fri, 01 Nov 2019 19:40:04 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Linus Torvalds <torvalds@linux-foundation.org>, yong.liu@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

The pull request you sent on Fri, 1 Nov 2019 15:33:57 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9e5eefba3d098d66defa1ce59a34a41a96f49771

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
