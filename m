Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3017373F
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:04:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0888B14C6;
	Wed, 24 Jul 2019 18:59:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 98D0FD95
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C0154FE
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:34 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t132so20499672pgb.9
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 21:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=O+df2I4TC5wSBN7Em5oodjAicQ0h4N55TIXEwhFfOE8=;
	b=dT/q1EiIaZOtDdL3HV/QOzHzsDHfdLExn0xz4e9uVNKqEUH1JPdJd8CuNeW8B/wxSe
	uVovaNDsULEFnzgjkLvzzmokCVO++hnkf5KmdsGeROd1Zl7OxAF1TJ6k4W3ZltfNSNzJ
	BEl5n6nZLhGNy0bQqdCPtgnUqKrkFQ4zYMsaZbX9RQNSqSiltrmZvWMpRLjx7ScpS3eM
	klezQZVLZFX/jERYm+o8MnnWWHew0e2Yh6imZT7Cp1CTuM7HqL88XzFBNHAgj8Opq+Cg
	IFLb/mOFgqGRQ8epFvAEHa2kjJnPTABX27HKV6/WBPLTwIXLB/v/JUKm6klwQGVw8iie
	cq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O+df2I4TC5wSBN7Em5oodjAicQ0h4N55TIXEwhFfOE8=;
	b=CEbeixnfG73ebqIbyeSwKuanMgax/+tNHkkUvh0lWJ3xHjcgjandiXED9YzF/imyBz
	SxSUCCFxXdV1x+3R3TVISSJ9Gm5jKnlYrbbG1DS/V5bJE+ZbLR2QS8uHdtvjJCNreTqv
	Tm46/Qp4Dnx5NPL4ZXk2kTELlUcdb9JrJPLginj5i7d3PRwx/4BoADaxRKBHyOnmHgtP
	WNHraCKMJWIMXtRDzGQnCN2cmnQJpoS2DohpICG9hzMhcK679ro3AtR7F6uD+5IBBosW
	f9YI+V1AHBbBzv+iXe+Qch9k8/dnFldoOqpmNtoitDxuZ4Q21YwDIJuomc0LglOv2WKL
	UJ5Q==
X-Gm-Message-State: APjAAAWsU7XrHY27KLME315v2fbmBAowSEP4K4rhREuFjGBA8yYUEkL0
	AMwkghBiuc6/AZNsyk+q9Js=
X-Google-Smtp-Source: APXvYqyvgCv1eDp6dy773mz9vUzmLnKPDzcw6J3eIwRmKYsm312digfMgY//0G6lCk4CuS5A+gszrw==
X-Received: by 2002:a17:90a:384d:: with SMTP id
	l13mr1798787pjf.86.1563942334345; 
	Tue, 23 Jul 2019 21:25:34 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
	by smtp.gmail.com with ESMTPSA id
	a15sm34153364pgw.3.2019.07.23.21.25.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 21:25:33 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 09/12] fs/fuse: convert put_page() to put_user_page*()
Date: Tue, 23 Jul 2019 21:25:15 -0700
Message-Id: <20190724042518.14363-10-jhubbard@nvidia.com>
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
Cc: Boaz Harrosh <boaz@plexistor.com>, Jan Kara <jack@suse.cz>,
	kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
	Dave Chinner <david@fromorbit.com>,
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

RnJvbTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+CgpGb3IgcGFnZXMgdGhh
dCB3ZXJlIHJldGFpbmVkIHZpYSBnZXRfdXNlcl9wYWdlcyooKSwgcmVsZWFzZSB0aG9zZSBwYWdl
cwp2aWEgdGhlIG5ldyBwdXRfdXNlcl9wYWdlKigpIHJvdXRpbmVzLCBpbnN0ZWFkIG9mIHZpYSBw
dXRfcGFnZSgpLgoKVGhpcyBpcyBwYXJ0IGEgdHJlZS13aWRlIGNvbnZlcnNpb24sIGFzIGRlc2Ny
aWJlZCBpbiBjb21taXQgZmMxZDhlN2NjYTJkCigibW06IGludHJvZHVjZSBwdXRfdXNlcl9wYWdl
KigpLCBwbGFjZWhvbGRlciB2ZXJzaW9ucyIpLgoKQ2hhbmdlcyBmcm9tIErDqXLDtG1lJ3Mgb3Jp
Z2luYWwgcGF0Y2g6CgoqIFVzZSB0aGUgZW5oYW5jZWQgcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9j
aygpLgoKU2lnbmVkLW9mZi1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+
ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KQ2M6IGxp
bnV4LWZzZGV2ZWxAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1ibG9ja0B2Z2VyLmtlcm5lbC5v
cmcKQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6
IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgpDYzogQWxleGFuZGVyIFZp
cm8gPHZpcm9AemVuaXYubGludXgub3JnLnVrPgpDYzogSm9oYW5uZXMgVGh1bXNoaXJuIDxqdGh1
bXNoaXJuQHN1c2UuZGU+CkNjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KQ2M6IEpl
bnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4KQ2M6IE1pbmcgTGVpIDxtaW5nLmxlaUByZWRoYXQu
Y29tPgpDYzogRGF2ZSBDaGlubmVyIDxkYXZpZEBmcm9tb3JiaXQuY29tPgpDYzogSmFzb24gR3Vu
dGhvcnBlIDxqZ2dAemllcGUuY2E+CkNjOiBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFk
Lm9yZz4KQ2M6IEJvYXogSGFycm9zaCA8Ym9hekBwbGV4aXN0b3IuY29tPgpDYzogTWlrbG9zIFN6
ZXJlZGkgPG1pa2xvc0BzemVyZWRpLmh1PgotLS0KIGZzL2Z1c2UvZGV2LmMgIHwgMjIgKysrKysr
KysrKysrKysrKystLS0tCiBmcy9mdXNlL2ZpbGUuYyB8IDUzICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDU3IGluc2Vy
dGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2Z1c2UvZGV2LmMgYi9m
cy9mdXNlL2Rldi5jCmluZGV4IGVhODIzNzUxM2RmYS4uOGVmNjVjOWNkM2Y2IDEwMDY0NAotLS0g
YS9mcy9mdXNlL2Rldi5jCisrKyBiL2ZzL2Z1c2UvZGV2LmMKQEAgLTc4MCw2ICs3ODAsNyBAQCBz
dHJ1Y3QgZnVzZV9jb3B5X3N0YXRlIHsKIAl1bnNpZ25lZCBsZW47CiAJdW5zaWduZWQgb2Zmc2V0
OwogCXVuc2lnbmVkIG1vdmVfcGFnZXM6MTsKKwlib29sIGZyb21fZ3VwOwogfTsKIAogc3RhdGlj
IHZvaWQgZnVzZV9jb3B5X2luaXQoc3RydWN0IGZ1c2VfY29weV9zdGF0ZSAqY3MsIGludCB3cml0
ZSwKQEAgLTgwMCwxMyArODAxLDIyIEBAIHN0YXRpYyB2b2lkIGZ1c2VfY29weV9maW5pc2goc3Ry
dWN0IGZ1c2VfY29weV9zdGF0ZSAqY3MpCiAJCQlidWYtPmxlbiA9IFBBR0VfU0laRSAtIGNzLT5s
ZW47CiAJCWNzLT5jdXJyYnVmID0gTlVMTDsKIAl9IGVsc2UgaWYgKGNzLT5wZykgewotCQlpZiAo
Y3MtPndyaXRlKSB7Ci0JCQlmbHVzaF9kY2FjaGVfcGFnZShjcy0+cGcpOwotCQkJc2V0X3BhZ2Vf
ZGlydHlfbG9jayhjcy0+cGcpOworCQlpZiAoY3MtPmZyb21fZ3VwKSB7CisJCQlpZiAoY3MtPndy
aXRlKSB7CisJCQkJZmx1c2hfZGNhY2hlX3BhZ2UoY3MtPnBnKTsKKwkJCQlwdXRfdXNlcl9wYWdl
c19kaXJ0eV9sb2NrKCZjcy0+cGcsIDEsIHRydWUpOworCQkJfSBlbHNlCisJCQkJcHV0X3VzZXJf
cGFnZShjcy0+cGcpOworCQl9IGVsc2UgeworCQkJaWYgKGNzLT53cml0ZSkgeworCQkJCWZsdXNo
X2RjYWNoZV9wYWdlKGNzLT5wZyk7CisJCQkJc2V0X3BhZ2VfZGlydHlfbG9jayhjcy0+cGcpOwor
CQkJfQorCQkJcHV0X3BhZ2UoY3MtPnBnKTsKIAkJfQotCQlwdXRfcGFnZShjcy0+cGcpOwogCX0K
IAljcy0+cGcgPSBOVUxMOworCWNzLT5mcm9tX2d1cCA9IGZhbHNlOwogfQogCiAvKgpAQCAtODM0
LDYgKzg0NCw3IEBAIHN0YXRpYyBpbnQgZnVzZV9jb3B5X2ZpbGwoc3RydWN0IGZ1c2VfY29weV9z
dGF0ZSAqY3MpCiAJCQlCVUdfT04oIWNzLT5ucl9zZWdzKTsKIAkJCWNzLT5jdXJyYnVmID0gYnVm
OwogCQkJY3MtPnBnID0gYnVmLT5wYWdlOworCQkJY3MtPmZyb21fZ3VwID0gZmFsc2U7CiAJCQlj
cy0+b2Zmc2V0ID0gYnVmLT5vZmZzZXQ7CiAJCQljcy0+bGVuID0gYnVmLT5sZW47CiAJCQljcy0+
cGlwZWJ1ZnMrKzsKQEAgLTg1MSw2ICs4NjIsNyBAQCBzdGF0aWMgaW50IGZ1c2VfY29weV9maWxs
KHN0cnVjdCBmdXNlX2NvcHlfc3RhdGUgKmNzKQogCQkJYnVmLT5sZW4gPSAwOwogCiAJCQljcy0+
Y3VycmJ1ZiA9IGJ1ZjsKKwkJCWNzLT5mcm9tX2d1cCA9IGZhbHNlOwogCQkJY3MtPnBnID0gcGFn
ZTsKIAkJCWNzLT5vZmZzZXQgPSAwOwogCQkJY3MtPmxlbiA9IFBBR0VfU0laRTsKQEAgLTg2Niw2
ICs4NzgsNyBAQCBzdGF0aWMgaW50IGZ1c2VfY29weV9maWxsKHN0cnVjdCBmdXNlX2NvcHlfc3Rh
dGUgKmNzKQogCQljcy0+bGVuID0gZXJyOwogCQljcy0+b2Zmc2V0ID0gb2ZmOwogCQljcy0+cGcg
PSBwYWdlOworCQljcy0+ZnJvbV9ndXAgPSBpb3ZfaXRlcl9nZXRfcGFnZXNfdXNlX2d1cChjcy0+
aXRlcik7CiAJCWlvdl9pdGVyX2FkdmFuY2UoY3MtPml0ZXIsIGVycik7CiAJfQogCkBAIC0xMDAw
LDYgKzEwMTMsNyBAQCBzdGF0aWMgaW50IGZ1c2VfdHJ5X21vdmVfcGFnZShzdHJ1Y3QgZnVzZV9j
b3B5X3N0YXRlICpjcywgc3RydWN0IHBhZ2UgKipwYWdlcCkKIAl1bmxvY2tfcGFnZShuZXdwYWdl
KTsKIG91dF9mYWxsYmFjazoKIAljcy0+cGcgPSBidWYtPnBhZ2U7CisJY3MtPmZyb21fZ3VwID0g
ZmFsc2U7CiAJY3MtPm9mZnNldCA9IGJ1Zi0+b2Zmc2V0OwogCiAJZXJyID0gbG9ja19yZXF1ZXN0
KGNzLT5yZXEpOwpkaWZmIC0tZ2l0IGEvZnMvZnVzZS9maWxlLmMgYi9mcy9mdXNlL2ZpbGUuYwpp
bmRleCA1YWUyODI4YmViMDAuLmMzNGMyMmFjNWIyMiAxMDA2NDQKLS0tIGEvZnMvZnVzZS9maWxl
LmMKKysrIGIvZnMvZnVzZS9maWxlLmMKQEAgLTU0MywxMiArNTQzLDIwIEBAIHZvaWQgZnVzZV9y
ZWFkX2ZpbGwoc3RydWN0IGZ1c2VfcmVxICpyZXEsIHN0cnVjdCBmaWxlICpmaWxlLCBsb2ZmX3Qg
cG9zLAogCXJlcS0+b3V0LmFyZ3NbMF0uc2l6ZSA9IGNvdW50OwogfQogCi1zdGF0aWMgdm9pZCBm
dXNlX3JlbGVhc2VfdXNlcl9wYWdlcyhzdHJ1Y3QgZnVzZV9yZXEgKnJlcSwgYm9vbCBzaG91bGRf
ZGlydHkpCitzdGF0aWMgdm9pZCBmdXNlX3JlbGVhc2VfdXNlcl9wYWdlcyhzdHJ1Y3QgZnVzZV9y
ZXEgKnJlcSwgYm9vbCBzaG91bGRfZGlydHksCisJCQkJICAgIGJvb2wgZnJvbV9ndXApCiB7CiAJ
dW5zaWduZWQgaTsKIAorCWlmIChmcm9tX2d1cCkgeworCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9s
b2NrKHJlcS0+cGFnZXMsIHJlcS0+bnVtX3BhZ2VzLAorCQkJCQkgIHNob3VsZF9kaXJ0eSk7CisJ
CXJldHVybjsKKwl9CisKIAlmb3IgKGkgPSAwOyBpIDwgcmVxLT5udW1fcGFnZXM7IGkrKykgewog
CQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IHJlcS0+cGFnZXNbaV07CisKIAkJaWYgKHNob3VsZF9kaXJ0
eSkKIAkJCXNldF9wYWdlX2RpcnR5X2xvY2socGFnZSk7CiAJCXB1dF9wYWdlKHBhZ2UpOwpAQCAt
NjIxLDEyICs2MjksMTMgQEAgc3RhdGljIHZvaWQgZnVzZV9haW9fY29tcGxldGUoc3RydWN0IGZ1
c2VfaW9fcHJpdiAqaW8sIGludCBlcnIsIHNzaXplX3QgcG9zKQogCWtyZWZfcHV0KCZpby0+cmVm
Y250LCBmdXNlX2lvX3JlbGVhc2UpOwogfQogCi1zdGF0aWMgdm9pZCBmdXNlX2Fpb19jb21wbGV0
ZV9yZXEoc3RydWN0IGZ1c2VfY29ubiAqZmMsIHN0cnVjdCBmdXNlX3JlcSAqcmVxKQorc3RhdGlj
IHZvaWQgX2Z1c2VfYWlvX2NvbXBsZXRlX3JlcShzdHJ1Y3QgZnVzZV9jb25uICpmYywgc3RydWN0
IGZ1c2VfcmVxICpyZXEsCisJCQkJICAgYm9vbCBmcm9tX2d1cCkKIHsKIAlzdHJ1Y3QgZnVzZV9p
b19wcml2ICppbyA9IHJlcS0+aW87CiAJc3NpemVfdCBwb3MgPSAtMTsKIAotCWZ1c2VfcmVsZWFz
ZV91c2VyX3BhZ2VzKHJlcSwgaW8tPnNob3VsZF9kaXJ0eSk7CisJZnVzZV9yZWxlYXNlX3VzZXJf
cGFnZXMocmVxLCBpby0+c2hvdWxkX2RpcnR5LCBmcm9tX2d1cCk7CiAKIAlpZiAoaW8tPndyaXRl
KSB7CiAJCWlmIChyZXEtPm1pc2Mud3JpdGUuaW4uc2l6ZSAhPSByZXEtPm1pc2Mud3JpdGUub3V0
LnNpemUpCkBAIC02NDEsOCArNjUwLDE4IEBAIHN0YXRpYyB2b2lkIGZ1c2VfYWlvX2NvbXBsZXRl
X3JlcShzdHJ1Y3QgZnVzZV9jb25uICpmYywgc3RydWN0IGZ1c2VfcmVxICpyZXEpCiAJZnVzZV9h
aW9fY29tcGxldGUoaW8sIHJlcS0+b3V0LmguZXJyb3IsIHBvcyk7CiB9CiAKK3N0YXRpYyB2b2lk
IGZ1c2VfYWlvX2Zyb21fZ3VwX2NvbXBsZXRlX3JlcShzdHJ1Y3QgZnVzZV9jb25uICpmYywgc3Ry
dWN0IGZ1c2VfcmVxICpyZXEpCit7CisJX2Z1c2VfYWlvX2NvbXBsZXRlX3JlcShmYywgcmVxLCB0
cnVlKTsKK30KKworc3RhdGljIHZvaWQgZnVzZV9haW9fY29tcGxldGVfcmVxKHN0cnVjdCBmdXNl
X2Nvbm4gKmZjLCBzdHJ1Y3QgZnVzZV9yZXEgKnJlcSkKK3sKKwlfZnVzZV9haW9fY29tcGxldGVf
cmVxKGZjLCByZXEsIGZhbHNlKTsKK30KKwogc3RhdGljIHNpemVfdCBmdXNlX2FzeW5jX3JlcV9z
ZW5kKHN0cnVjdCBmdXNlX2Nvbm4gKmZjLCBzdHJ1Y3QgZnVzZV9yZXEgKnJlcSwKLQkJc2l6ZV90
IG51bV9ieXRlcywgc3RydWN0IGZ1c2VfaW9fcHJpdiAqaW8pCisJCXNpemVfdCBudW1fYnl0ZXMs
IHN0cnVjdCBmdXNlX2lvX3ByaXYgKmlvLCBib29sIGZyb21fZ3VwKQogewogCXNwaW5fbG9jaygm
aW8tPmxvY2spOwogCWtyZWZfZ2V0KCZpby0+cmVmY250KTsKQEAgLTY1MSw3ICs2NzAsOCBAQCBz
dGF0aWMgc2l6ZV90IGZ1c2VfYXN5bmNfcmVxX3NlbmQoc3RydWN0IGZ1c2VfY29ubiAqZmMsIHN0
cnVjdCBmdXNlX3JlcSAqcmVxLAogCXNwaW5fdW5sb2NrKCZpby0+bG9jayk7CiAKIAlyZXEtPmlv
ID0gaW87Ci0JcmVxLT5lbmQgPSBmdXNlX2Fpb19jb21wbGV0ZV9yZXE7CisJcmVxLT5lbmQgPSBm
cm9tX2d1cCA/IGZ1c2VfYWlvX2Zyb21fZ3VwX2NvbXBsZXRlX3JlcSA6CisJCSAgIGZ1c2VfYWlv
X2NvbXBsZXRlX3JlcTsKIAogCV9fZnVzZV9nZXRfcmVxdWVzdChyZXEpOwogCWZ1c2VfcmVxdWVz
dF9zZW5kX2JhY2tncm91bmQoZmMsIHJlcSk7CkBAIC02NjAsNyArNjgwLDggQEAgc3RhdGljIHNp
emVfdCBmdXNlX2FzeW5jX3JlcV9zZW5kKHN0cnVjdCBmdXNlX2Nvbm4gKmZjLCBzdHJ1Y3QgZnVz
ZV9yZXEgKnJlcSwKIH0KIAogc3RhdGljIHNpemVfdCBmdXNlX3NlbmRfcmVhZChzdHJ1Y3QgZnVz
ZV9yZXEgKnJlcSwgc3RydWN0IGZ1c2VfaW9fcHJpdiAqaW8sCi0JCQkgICAgIGxvZmZfdCBwb3Ms
IHNpemVfdCBjb3VudCwgZmxfb3duZXJfdCBvd25lcikKKwkJCSAgICAgbG9mZl90IHBvcywgc2l6
ZV90IGNvdW50LCBmbF9vd25lcl90IG93bmVyLAorCQkJICAgICBib29sIGZyb21fZ3VwKQogewog
CXN0cnVjdCBmaWxlICpmaWxlID0gaW8tPmlvY2ItPmtpX2ZpbHA7CiAJc3RydWN0IGZ1c2VfZmls
ZSAqZmYgPSBmaWxlLT5wcml2YXRlX2RhdGE7CkBAIC02NzUsNyArNjk2LDcgQEAgc3RhdGljIHNp
emVfdCBmdXNlX3NlbmRfcmVhZChzdHJ1Y3QgZnVzZV9yZXEgKnJlcSwgc3RydWN0IGZ1c2VfaW9f
cHJpdiAqaW8sCiAJfQogCiAJaWYgKGlvLT5hc3luYykKLQkJcmV0dXJuIGZ1c2VfYXN5bmNfcmVx
X3NlbmQoZmMsIHJlcSwgY291bnQsIGlvKTsKKwkJcmV0dXJuIGZ1c2VfYXN5bmNfcmVxX3NlbmQo
ZmMsIHJlcSwgY291bnQsIGlvLCBmcm9tX2d1cCk7CiAKIAlmdXNlX3JlcXVlc3Rfc2VuZChmYywg
cmVxKTsKIAlyZXR1cm4gcmVxLT5vdXQuYXJnc1swXS5zaXplOwpAQCAtNzU1LDcgKzc3Niw3IEBA
IHN0YXRpYyBpbnQgZnVzZV9kb19yZWFkcGFnZShzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHBh
Z2UgKnBhZ2UpCiAJcmVxLT5wYWdlX2Rlc2NzWzBdLmxlbmd0aCA9IGNvdW50OwogCWluaXRfc3lu
Y19raW9jYigmaW9jYiwgZmlsZSk7CiAJaW8gPSAoc3RydWN0IGZ1c2VfaW9fcHJpdikgRlVTRV9J
T19QUklWX1NZTkMoJmlvY2IpOwotCW51bV9yZWFkID0gZnVzZV9zZW5kX3JlYWQocmVxLCAmaW8s
IHBvcywgY291bnQsIE5VTEwpOworCW51bV9yZWFkID0gZnVzZV9zZW5kX3JlYWQocmVxLCAmaW8s
IHBvcywgY291bnQsIE5VTEwsIGZhbHNlKTsKIAllcnIgPSByZXEtPm91dC5oLmVycm9yOwogCiAJ
aWYgKCFlcnIpIHsKQEAgLTk3Niw3ICs5OTcsOCBAQCBzdGF0aWMgdm9pZCBmdXNlX3dyaXRlX2Zp
bGwoc3RydWN0IGZ1c2VfcmVxICpyZXEsIHN0cnVjdCBmdXNlX2ZpbGUgKmZmLAogfQogCiBzdGF0
aWMgc2l6ZV90IGZ1c2Vfc2VuZF93cml0ZShzdHJ1Y3QgZnVzZV9yZXEgKnJlcSwgc3RydWN0IGZ1
c2VfaW9fcHJpdiAqaW8sCi0JCQkgICAgICBsb2ZmX3QgcG9zLCBzaXplX3QgY291bnQsIGZsX293
bmVyX3Qgb3duZXIpCisJCQkgICAgICBsb2ZmX3QgcG9zLCBzaXplX3QgY291bnQsIGZsX293bmVy
X3Qgb3duZXIsCisJCQkgICAgICBib29sIGZyb21fZ3VwKQogewogCXN0cnVjdCBraW9jYiAqaW9j
YiA9IGlvLT5pb2NiOwogCXN0cnVjdCBmaWxlICpmaWxlID0gaW9jYi0+a2lfZmlscDsKQEAgLTk5
Niw3ICsxMDE4LDcgQEAgc3RhdGljIHNpemVfdCBmdXNlX3NlbmRfd3JpdGUoc3RydWN0IGZ1c2Vf
cmVxICpyZXEsIHN0cnVjdCBmdXNlX2lvX3ByaXYgKmlvLAogCX0KIAogCWlmIChpby0+YXN5bmMp
Ci0JCXJldHVybiBmdXNlX2FzeW5jX3JlcV9zZW5kKGZjLCByZXEsIGNvdW50LCBpbyk7CisJCXJl
dHVybiBmdXNlX2FzeW5jX3JlcV9zZW5kKGZjLCByZXEsIGNvdW50LCBpbywgZnJvbV9ndXApOwog
CiAJZnVzZV9yZXF1ZXN0X3NlbmQoZmMsIHJlcSk7CiAJcmV0dXJuIHJlcS0+bWlzYy53cml0ZS5v
dXQuc2l6ZTsKQEAgLTEwMzEsNyArMTA1Myw3IEBAIHN0YXRpYyBzaXplX3QgZnVzZV9zZW5kX3dy
aXRlX3BhZ2VzKHN0cnVjdCBmdXNlX3JlcSAqcmVxLCBzdHJ1Y3Qga2lvY2IgKmlvY2IsCiAJZm9y
IChpID0gMDsgaSA8IHJlcS0+bnVtX3BhZ2VzOyBpKyspCiAJCWZ1c2Vfd2FpdF9vbl9wYWdlX3dy
aXRlYmFjayhpbm9kZSwgcmVxLT5wYWdlc1tpXS0+aW5kZXgpOwogCi0JcmVzID0gZnVzZV9zZW5k
X3dyaXRlKHJlcSwgJmlvLCBwb3MsIGNvdW50LCBOVUxMKTsKKwlyZXMgPSBmdXNlX3NlbmRfd3Jp
dGUocmVxLCAmaW8sIHBvcywgY291bnQsIE5VTEwsIGZhbHNlKTsKIAogCW9mZnNldCA9IHJlcS0+
cGFnZV9kZXNjc1swXS5vZmZzZXQ7CiAJY291bnQgPSByZXM7CkBAIC0xMzUxLDYgKzEzNzMsNyBA
QCBzc2l6ZV90IGZ1c2VfZGlyZWN0X2lvKHN0cnVjdCBmdXNlX2lvX3ByaXYgKmlvLCBzdHJ1Y3Qg
aW92X2l0ZXIgKml0ZXIsCiAJc3NpemVfdCByZXMgPSAwOwogCXN0cnVjdCBmdXNlX3JlcSAqcmVx
OwogCWludCBlcnIgPSAwOworCWJvb2wgZnJvbV9ndXAgPSBpb3ZfaXRlcl9nZXRfcGFnZXNfdXNl
X2d1cChpdGVyKTsKIAogCWlmIChpby0+YXN5bmMpCiAJCXJlcSA9IGZ1c2VfZ2V0X3JlcV9mb3Jf
YmFja2dyb3VuZChmYywgaW92X2l0ZXJfbnBhZ2VzKGl0ZXIsCkBAIC0xMzg0LDEzICsxNDA3LDE1
IEBAIHNzaXplX3QgZnVzZV9kaXJlY3RfaW8oc3RydWN0IGZ1c2VfaW9fcHJpdiAqaW8sIHN0cnVj
dCBpb3ZfaXRlciAqaXRlciwKIAkJCQlpbmFyZyA9ICZyZXEtPm1pc2Mud3JpdGUuaW47CiAJCQkJ
aW5hcmctPndyaXRlX2ZsYWdzIHw9IEZVU0VfV1JJVEVfS0lMTF9QUklWOwogCQkJfQotCQkJbnJl
cyA9IGZ1c2Vfc2VuZF93cml0ZShyZXEsIGlvLCBwb3MsIG5ieXRlcywgb3duZXIpOworCQkJbnJl
cyA9IGZ1c2Vfc2VuZF93cml0ZShyZXEsIGlvLCBwb3MsIG5ieXRlcywgb3duZXIsCisJCQkJCSAg
ICAgICBmcm9tX2d1cCk7CiAJCX0gZWxzZSB7Ci0JCQlucmVzID0gZnVzZV9zZW5kX3JlYWQocmVx
LCBpbywgcG9zLCBuYnl0ZXMsIG93bmVyKTsKKwkJCW5yZXMgPSBmdXNlX3NlbmRfcmVhZChyZXEs
IGlvLCBwb3MsIG5ieXRlcywgb3duZXIsCisJCQkJCSAgICAgIGZyb21fZ3VwKTsKIAkJfQogCiAJ
CWlmICghaW8tPmFzeW5jKQotCQkJZnVzZV9yZWxlYXNlX3VzZXJfcGFnZXMocmVxLCBpby0+c2hv
dWxkX2RpcnR5KTsKKwkJCWZ1c2VfcmVsZWFzZV91c2VyX3BhZ2VzKHJlcSwgaW8tPnNob3VsZF9k
aXJ0eSwgZnJvbV9ndXApOwogCQlpZiAocmVxLT5vdXQuaC5lcnJvcikgewogCQkJZXJyID0gcmVx
LT5vdXQuaC5lcnJvcjsKIAkJCWJyZWFrOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
