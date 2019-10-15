Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6B2D7E15
	for <lists.virtualization@lfdr.de>; Tue, 15 Oct 2019 19:47:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D49F9F7A;
	Tue, 15 Oct 2019 17:46:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 20214EEC
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 17:46:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 944478AC
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 17:46:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A7E06412F;
	Tue, 15 Oct 2019 17:46:42 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82B4A60166;
	Tue, 15 Oct 2019 17:46:35 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 138B6220B4B; Tue, 15 Oct 2019 13:46:35 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org,
	virtio-fs@redhat.com
Subject: [PATCH 0/5] virtiofs: Fix couple of deadlocks
Date: Tue, 15 Oct 2019 13:46:21 -0400
Message-Id: <20191015174626.11593-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 15 Oct 2019 17:46:42 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: miklos@szeredi.hu, chirantan@chromium.org, dgilbert@redhat.com,
	virtualization@lists.linux-foundation.org, stefanha@redhat.com,
	vgoyal@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Hi,

We have couple of places which can result in deadlock. This patch series
fixes these.

We can be called with fc->bg_lock (for background requests) while
submitting a request. This leads to two constraints.

- We can't end requests in submitter's context and call fuse_end_request()
  as it tries to take fc->bg_lock as well. So queue these requests on a
  list and use a worker to end these requests.

- If virtqueue is full, we can wait with fc->bg_lock held for queue to
  have space. Worker which is completing the request gets blocked on
  fc->bg_lock as well. And that means requests are not completing, that
  means descriptors are not being freed and that means submitter can't
  make progress. Deadlock. 

  Fix this by punting the requests to a list and retry submission later
  with the help of a worker.

Thanks
Vivek

Vivek Goyal (5):
  virtiofs: Do not end request in submission context
  virtiofs: No need to check fpq->connected state
  virtiofs: Set FR_SENT flag only after request has been sent
  virtiofs: Count pending forgets as in_flight forgets
  virtiofs: Retry request submission from worker context

 fs/fuse/virtio_fs.c | 165 +++++++++++++++++++++++++++++---------------
 1 file changed, 111 insertions(+), 54 deletions(-)

-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
