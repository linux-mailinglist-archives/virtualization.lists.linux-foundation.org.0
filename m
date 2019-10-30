Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAF4E9E65
	for <lists.virtualization@lfdr.de>; Wed, 30 Oct 2019 16:08:26 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4ED1DE9D;
	Wed, 30 Oct 2019 15:07:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DD946E58
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 15:07:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 44CE342D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 15:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572448069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding;
	bh=tAmJCcma8tMfaZZhSnuziMQ0xZCDAhkTYFHnjIDKQN0=;
	b=IElkC+vosblhk2hbcPxnx/+tGxEUvZ+THIMmJfpWa/5k+Qwp0YnJpWuTGO6y7DRMX1OYrw
	36BYiLHpIAhHzG1Qww/m2TXCswu4c7POSwPkjn7Py2ybzUM6uaVyL8ysBdHOKGUKcnTBDf
	yg5nzY5ohVrHK/OCYs1c57Gdqa7oOi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-262-j29PkrUkOkOLNNsz2ewIgg-1; Wed, 30 Oct 2019 11:07:46 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 100C11005500;
	Wed, 30 Oct 2019 15:07:45 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B260600C6;
	Wed, 30 Oct 2019 15:07:39 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id D41862237B5; Wed, 30 Oct 2019 11:07:38 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtio-fs@redhat.com
Subject: [PATCH 0/3] virtiofs: Small Cleanups for 5.5
Date: Wed, 30 Oct 2019 11:07:16 -0400
Message-Id: <20191030150719.29048-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: j29PkrUkOkOLNNsz2ewIgg-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dgilbert@redhat.com, miklos@szeredi.hu, stefanha@redhat.com,
	vgoyal@redhat.com, virtualization@lists.linux-foundation.org
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

Hi Miklos,

Here are few small cleanups for virtiofs for 5.5. I had received some
comments from Michael Tsirkin on original virtiofs patches and these
cleanups are result of these comments.

Thanks
Vivek

Vivek Goyal (3):
  virtiofs: Use a common function to send forget
  virtiofs: Do not send forget request "struct list_head" element
  virtiofs: Use completions while waiting for queue to be drained

 fs/fuse/virtio_fs.c | 204 ++++++++++++++++++++++----------------------
 1 file changed, 103 insertions(+), 101 deletions(-)

-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
