Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0066373733
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:03:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1EFE114BC;
	Wed, 24 Jul 2019 18:59:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CF22ACC4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8EA06F1
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:24 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id f20so11276951pgj.0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 21:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qETbyvDGXmWMmkqN4sOdgKXeFkWOntX3r/NRFgCZoWE=;
	b=KG/F7Sd5J79dEipElYhdvyhMIk0TxQlRtZu9bi85rUwY/TE5KUGgUZYMnF+3jcDsXr
	jk+YAZfWVg6gnp2IiqLCse5lUUZrgh27wRKMfQRWXUdRnaO5ZlXDztHkfwCA1gRbK+Qa
	Vdl/mcDwYDvc/aIthkQn3dHIfadxoz9OGVoTMkITstrb8gRinr4GRivAlsVYAzJkRXx3
	qijzZ8AyOYgc5Vk4JND+9sG/qLIVyx5s39WeHO+RM9Ey6ODD5O8kuqfL85vwwK9Febym
	eFolpJZ4Wkv3lsIz5mVKSWu4wewrN05ykT4POz6d2Mi/mkYtEQg5LGvW/0qsyHcM4WB5
	F1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qETbyvDGXmWMmkqN4sOdgKXeFkWOntX3r/NRFgCZoWE=;
	b=lmYLR61sG87vExIUEQSXtThvkRu3MrJAH8xSaKYWRDYhIdFNzwPFYMVQgug5DrWazZ
	5uwFMLls7E5VShPQxwEzuR9X8PyAzxR8xascSHq/RKwmo3VlFCqlb4WDr6D+xYpYd2QO
	JsmOg/vuZmrR+Jy/Q4nCDbB6lM4eHYfNV9rqBsvvQ+P5sZxmF8an6/HAxI8/eVBISEVw
	qqIDz6umKhbIEpstw8l1sUJbuucI0PZTcY+soWjmnHSNo9xjVuQmBwrOcLzCOabcTQa9
	NwHuF4VAgEz8U+2OxZZEiFneKf++rnIrU+vQl1oQM+47Xxia5/KUcZpkuURigqZnJdnn
	7Hew==
X-Gm-Message-State: APjAAAX64bFRWgWi53eCyTbEI9ao+EaNIEBuu5LrtADWS++X7EfUIEyb
	X1RtaDUR+NlK/FDGQfny/P4=
X-Google-Smtp-Source: APXvYqxkwpMUKWSZK/4NQcFDw+bDP7yRS/NluRzHQboqTdh3aehK42NKuj/IACv1wat7jP2wWUy+ng==
X-Received: by 2002:a65:4489:: with SMTP id l9mr81979980pgq.207.1563942324157; 
	Tue, 23 Jul 2019 21:25:24 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
	by smtp.gmail.com with ESMTPSA id
	a15sm34153364pgw.3.2019.07.23.21.25.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 21:25:23 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 02/12] iov_iter: add helper to test if an iter would use GUP v2
Date: Tue, 23 Jul 2019 21:25:08 -0700
Message-Id: <20190724042518.14363-3-jhubbard@nvidia.com>
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
Cc: Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
	"Michael S . Tsirkin" <mst@redhat.com>, Dave Chinner <david@fromorbit.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Christoph Hellwig <hch@lst.de>, linux-cifs@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Johannes Thumshirn <jthumshirn@suse.de>,
	v9fs-developer@lists.sourceforge.net,
	Eric Van Hensbergen <ericvh@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

RnJvbTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+CgpBZGQgYSBoZWxwZXIg
dG8gdGVzdCBpZiBjYWxsIHRvIGlvdl9pdGVyX2dldF9wYWdlcyooKSB3aXRoIGEgZ2l2ZW4KaXRl
ciB3b3VsZCByZXN1bHQgaW4gY2FsbHMgdG8gR1VQIChnZXRfdXNlcl9wYWdlcyooKSkuIFdlIHdh
bnQgdG8KdXNlIGRpZmZlcmVudCB0cmFja2luZyBvZiBwYWdlIHJlZmVyZW5jZXMgaWYgdGhleSBh
cmUgY29taW5nIGZyb20KR1VQIChnZXRfdXNlcl9wYWdlcyooKSkgYW5kIHRodXMgIHdlIG5lZWQg
dG8ga25vdyB3aGVuIEdVUCBpcyB1c2VkCmZvciBhIGdpdmVuIGl0ZXIuCgpDaGFuZ2VzIHNpbmNl
IErDqXLDtG1lJ3Mgb3JpZ2luYWwgcGF0Y2g6CgoqIGlvdl9pdGVyX2dldF9wYWdlc191c2VfZ3Vw
KCk6IGRvIG5vdCByZXR1cm4gdHJ1ZSBmb3IgdGhlIElURVJfUElQRQpjYXNlLCBiZWNhdXNlIGlv
dl9pdGVyX2dldF9wYWdlcygpIGNhbGxzIHBpcGVfZ2V0X3BhZ2VzKCksIHdoaWNoIGluCnR1cm4g
dXNlcyBnZXRfcGFnZSgpLCBub3QgZ2V0X3VzZXJfcGFnZXMoKS4KCiogUmVtb3ZlIHNvbWUgb2Jz
b2xldGUgY29kZSwgYXMgcGFydCBvZiByZWJhc2luZyBvbnRvIExpbnV4IDUuMy4KCiogRml4IHVw
IHRoZSBrZXJuZWxkb2MgY29tbWVudCB0byAiUmV0dXJuOiIgcmF0aGVyIHRoYW4gIlJldHVybnM6
IiwKYW5kIGEgZmV3IG90aGVyIGdyYW1tYXRpY2FsIHR3ZWFrcy4KClNpZ25lZC1vZmYtYnk6IErD
qXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+CkNjOiBsaW51eC1mc2RldmVsQHZnZXIua2VybmVs
Lm9yZwpDYzogbGludXgtYmxvY2tAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1tbUBrdmFjay5v
cmcKQ2M6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KQ2M6IEphbiBLYXJhIDxq
YWNrQHN1c2UuY3o+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4K
Q2M6IEFsZXhhbmRlciBWaXJvIDx2aXJvQHplbml2LmxpbnV4Lm9yZy51az4KQ2M6IEpvaGFubmVz
IFRodW1zaGlybiA8anRodW1zaGlybkBzdXNlLmRlPgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhj
aEBsc3QuZGU+CkNjOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+CkNjOiBNaW5nIExlaSA8
bWluZy5sZWlAcmVkaGF0LmNvbT4KQ2M6IERhdmUgQ2hpbm5lciA8ZGF2aWRAZnJvbW9yYml0LmNv
bT4KQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgpDYzogTWF0dGhldyBXaWxjb3gg
PHdpbGx5QGluZnJhZGVhZC5vcmc+Ci0tLQogaW5jbHVkZS9saW51eC91aW8uaCB8IDExICsrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvdWlvLmggYi9pbmNsdWRlL2xpbnV4L3Vpby5oCmluZGV4IGFiNWY1MjNiYzBk
Zi4uMmExNzlhZjhlNWE3IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L3Vpby5oCisrKyBiL2lu
Y2x1ZGUvbGludXgvdWlvLmgKQEAgLTg2LDYgKzg2LDE3IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWdu
ZWQgY2hhciBpb3ZfaXRlcl9ydyhjb25zdCBzdHJ1Y3QgaW92X2l0ZXIgKmkpCiAJcmV0dXJuIGkt
PnR5cGUgJiAoUkVBRCB8IFdSSVRFKTsKIH0KIAorLyoqCisgKiBpb3ZfaXRlcl9nZXRfcGFnZXNf
dXNlX2d1cCAtIHJlcG9ydCBpZiBpb3ZfaXRlcl9nZXRfcGFnZXMoaSkgdXNlcyBHVVAKKyAqIEBp
OiBpdGVyYXRvcgorICogUmV0dXJuOiB0cnVlIGlmIGEgY2FsbCB0byBpb3ZfaXRlcl9nZXRfcGFn
ZXMqKCkgd2l0aCB0aGUgaXRlciBwcm92aWRlZCBpbgorICogICAgICAgICAgdGhlIGFyZ3VtZW50
IHdvdWxkIHJlc3VsdCBpbiB0aGUgdXNlIG9mIGdldF91c2VyX3BhZ2VzKigpCisgKi8KK3N0YXRp
YyBpbmxpbmUgYm9vbCBpb3ZfaXRlcl9nZXRfcGFnZXNfdXNlX2d1cChjb25zdCBzdHJ1Y3QgaW92
X2l0ZXIgKmkpCit7CisJcmV0dXJuIGlvdl9pdGVyX3R5cGUoaSkgPT0gSVRFUl9JT1ZFQzsKK30K
KwogLyoKICAqIFRvdGFsIG51bWJlciBvZiBieXRlcyBjb3ZlcmVkIGJ5IGFuIGlvdmVjLgogICoK
LS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
