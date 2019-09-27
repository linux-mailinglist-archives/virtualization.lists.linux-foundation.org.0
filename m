Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3F2C0E35
	for <lists.virtualization@lfdr.de>; Sat, 28 Sep 2019 01:00:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A7AFB15C1;
	Fri, 27 Sep 2019 23:00:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2C76512AD
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 23:00:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0CB058F3
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 23:00:05 +0000 (UTC)
Subject: Re: [GIT PULL] add virtio-fs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569625204;
	bh=lZdnGmEpHQjZEC9pHyYMZwLDTAoeVbVYJFbPvrM2Gog=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=RLNZkEXkmtVATcT3eC83J6UAuJ3Ayf9N10slIKejiKMcwXitP2/4qJAreZs5CXw1V
	eLrCHP0Or21LRyTcHm4Ik8S9SHYqV31FnhPrZjKE1Ko19vkAVKs1mq4T3KelTDFByX
	bmy0W4HOkFOWx2Gd7ex27AVuVNfdlium6MpiNAcc=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190926084340.GB1904@miu.piliscsaba.redhat.com>
References: <20190926084340.GB1904@miu.piliscsaba.redhat.com>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190926084340.GB1904@miu.piliscsaba.redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
	tags/virtio-fs-5.4
X-PR-Tracked-Commit-Id: a62a8ef9d97da23762a588592c8b8eb50a8deb6a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8f744bdee4fefb17fac052c7418b830de2b59ac8
Message-Id: <156962520482.10299.16614851801819928945.pr-tracker-bot@kernel.org>
Date: Fri, 27 Sep 2019 23:00:04 +0000
To: Miklos Szeredi <miklos@szeredi.hu>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	linux-kernel@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	linux-fsdevel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Vivek Goyal <vgoyal@redhat.com>
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

The pull request you sent on Thu, 26 Sep 2019 10:43:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git tags/virtio-fs-5.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8f744bdee4fefb17fac052c7418b830de2b59ac8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
