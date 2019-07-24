Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA6A73743
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:05:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C51DF14CD;
	Wed, 24 Jul 2019 18:59:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 00767CC4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AB647709
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:38 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id f5so11685297pgu.5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 21:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=I1wDMaqOj/gzGRufAfLYBvs0e80ibIJerHEY6qRx+9Q=;
	b=AJiRp1Uswxxxj2fjLfbqacoLwH06WJ9mszsK/zlNhFuhNoSLtvKRmhFo9KLI7JLl8B
	hxIxG1xThvmkqqGsj4H+PIkZgqzG39WvTfqHCYX31eWH9qZ8HHJptRyRkIYZTdhpSSJA
	nZA7WnB2fukiDrq9dsIiMnZ4oXRSDbx8C0GrWwEoTfJ4nGsrUGvTe9DUv98TbDoHZftU
	2sPJK+pDMsCNPpAzyI5pMUhaliFeOadZMdLhzw1frV4a114QmQGutmlMg9ocT4gPTziz
	ZW1wdryUHfhxRuoKX5pPJ1KukLjcZAbAo24BFz30vzwXdEBQHRvTjXN7uylJkrR8anzL
	2E2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=I1wDMaqOj/gzGRufAfLYBvs0e80ibIJerHEY6qRx+9Q=;
	b=RGUcb05ZK1akFvz2e5nBHrKouBXRvFOv6i4nB7s5wXLT5UqNisRQ5v6pXpcuUrm+tG
	ak3TZEONKMr3eebCIn3eZnIVxx/odLP9xC8j+boJGEllZuGmFh0bE84Wj9aOiizECWvk
	+3kcN36KFbGphmfT9KZIglvd+v2MzAcUnWCCZ+fcBjpV2krMveraOaBDWKnvVErwTNen
	hS7gqQWxgOPYvkwniIikbUEcsEv0+yQw+7ReepL3rrHTsthsvYhW2dr8d1/j77m445f0
	6/HfNWMSqBcv+XmoiUD7Zm2X5ICH7312/Z0eaqYErEL/eZGgGVXOTY99nmpB+bEdExDW
	4NOw==
X-Gm-Message-State: APjAAAVHetxelgPunRy7/x78refH1tmj+zY7A1Dx3utguwheqZpheIAl
	fBXVmAJdFlyarBtiTfJSg5U=
X-Google-Smtp-Source: APXvYqwVZxneCPfv2nDeo72FQ4K0Ri4nG9i/Jh52gTbxtuFDM1ER91LNrK6Q0r6xmbSBuioIPNnbSg==
X-Received: by 2002:a62:38c6:: with SMTP id f189mr9250236pfa.157.1563942338440;
	Tue, 23 Jul 2019 21:25:38 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
	by smtp.gmail.com with ESMTPSA id
	a15sm34153364pgw.3.2019.07.23.21.25.37
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 21:25:38 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 12/12] fs/ceph: fix a build warning: returning a value from
	void function
Date: Tue, 23 Jul 2019 21:25:18 -0700
Message-Id: <20190724042518.14363-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190724042518.14363-1-jhubbard@nvidia.com>
References: <20190724042518.14363-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:22 +0000
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Christoph Hellwig <hch@lst.de>, linux-cifs@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	v9fs-developer@lists.sourceforge.net,
	Eric Van Hensbergen <ericvh@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, samba-technical@lists.samba.org,
	LKML <linux-kernel@vger.kernel.org>,
	"David S . Miller" <davem@davemloft.net>, linux-fsdevel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
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

From: John Hubbard <jhubbard@nvidia.com>

Trivial build warning fix: don't return a value from a function
whose type is "void".

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 fs/ceph/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ceph/debugfs.c b/fs/ceph/debugfs.c
index 2eb88ed22993..fa14c8e8761d 100644
--- a/fs/ceph/debugfs.c
+++ b/fs/ceph/debugfs.c
@@ -294,7 +294,7 @@ void ceph_fs_debugfs_init(struct ceph_fs_client *fsc)
 
 void ceph_fs_debugfs_init(struct ceph_fs_client *fsc)
 {
-	return 0;
+	return;
 }
 
 void ceph_fs_debugfs_cleanup(struct ceph_fs_client *fsc)
-- 
2.22.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
