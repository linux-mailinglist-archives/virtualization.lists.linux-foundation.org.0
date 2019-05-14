Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5E81D133
	for <lists.virtualization@lfdr.de>; Tue, 14 May 2019 23:20:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 83E33C6F;
	Tue, 14 May 2019 21:20:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2FBA3B59
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 21:20:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F0EFA84F
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 21:20:14 +0000 (UTC)
Subject: Re: [PULL] vhost: cleanups and fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1557868814;
	bh=sAZ3XnUOBom+63DLslp+1ES/j3Ot9HYCWDTdwVdx/cY=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=ho90yahGxZDTNsYTOSdjuex+X5jmeYETGsjwKUOfTSBpFylw9dv0t8o9MqSHtBRPC
	wJNtIXWY9jJ0ONz4JzpZasiU42EZZQkVzZECneNpc9lRjvRKG4zHVkx1fEZ0p8B3lj
	DeJLnTaiMhefMeQxVPoz1lZD0/rLhjE90wowHtbg=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190514171147-mutt-send-email-mst@kernel.org>
References: <20190514171147-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190514171147-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git
	tags/for_linus
X-PR-Tracked-Commit-Id: 050f4c4d2fbbd8217d94dc21051cc597d2a6848b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 35c99ffa20edd3c24be352d28a63cd3a23121282
Message-Id: <155786881470.21399.17909669772085382895.pr-tracker-bot@kernel.org>
Date: Tue, 14 May 2019 21:20:14 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: andrea.parri@amarulasolutions.com, kvm@vger.kernel.org, mst@redhat.com,
	netdev@vger.kernel.org, yuehaibing@huawei.com,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
	j.neuschaefer@gmx.net, pbonzini@redhat.com, benbjiang@tencent.com,
	Linus Torvalds <torvalds@linux-foundation.org>
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

The pull request you sent on Tue, 14 May 2019 17:11:47 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/35c99ffa20edd3c24be352d28a63cd3a23121282

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
