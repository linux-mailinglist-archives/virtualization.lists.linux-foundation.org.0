Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6061473742
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:04:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 852421428;
	Wed, 24 Jul 2019 18:59:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5C48CD8D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 88BBAF1
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:37 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id i18so20511829pgl.11
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 21:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=02PLAmxEK74OFGQcxHpfkZPpYQRAkLSlGOrHVK7lAMw=;
	b=ePnIO78ePHju7ebrVW+7E2J/vpPNCVR6NpW8CfFYZY8+SSmWHWKTO0NxnamQnOd1xO
	1OGkt7YIiEVXHuQP8H6qf68cFYAXKIBbDAmLkkhsEsKXGaZ+gv+hELN1BEUzOzwBMd5C
	7+HvBq9DyjWP27jxx3AYMLHiRTGVA6MLCEKX2iEJB87gzmXSiGwi7V4lsrRtpgVdiW2p
	S3MHstLpNUFBNRlULB+VzXVBuGOOpmhbNeL8feVmi88K1eJfS5jDJOTI4suhlSh6IsAx
	VQkyNWZZC80jbTtz6ZOUtfZ39jWAkyRwTKuVKYxnomrnDfjnpzs8p0BXzMO9GjL2eB9Q
	8kCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=02PLAmxEK74OFGQcxHpfkZPpYQRAkLSlGOrHVK7lAMw=;
	b=aojZrc5Mn+98p7XK4w8BZk6n2YuMUXrfa4hMHIJiIl2uavPm3Yw+qiDBwa1cusx2rI
	SWr6tiZGHWHE444vwJhYg/pbIJX+IY5EWZciYdHh5r9o+9HiQTXxeEnxrT26vlU/DIiz
	gobSGzozVG2mhCgCzenG097S5fy3+R0q1TaYJCoxsdZ3fWXIMFkL2VmCOeAJ4HXOOt8Y
	/SwBl8HcM9McRbkbNnW3anfWAqcvQ4mCIXcWSf3EVdULfWTCw7+t2cJqkjniyKZ+DEhH
	iiy869eFpOhjwcQOZS5xoBQZp3p+zwgBwQJbOL5WczO3zxaS8e5WOYiw5NPTbmqua72L
	oSAA==
X-Gm-Message-State: APjAAAXmyGesK//ay2qSD7YDRvD+bC7L2xRcIrjzbtTrD/lxHr05hAJT
	FteDBCM7EKog9W2Tnp1pZG0=
X-Google-Smtp-Source: APXvYqzqsCqiqq73YLTFw/re4Wrx/oAutFm/LKqajLsW6nTmQ7iAK5rTUPq3/lEGra2dE5Y0hbuJJw==
X-Received: by 2002:a62:cdc3:: with SMTP id o186mr9322982pfg.168.1563942337240;
	Tue, 23 Jul 2019 21:25:37 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
	by smtp.gmail.com with ESMTPSA id
	a15sm34153364pgw.3.2019.07.23.21.25.35
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 21:25:36 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 11/12] 9p/net: convert put_page() to put_user_page*()
Date: Tue, 23 Jul 2019 21:25:17 -0700
Message-Id: <20190724042518.14363-12-jhubbard@nvidia.com>
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
KigpLCBwbGFjZWhvbGRlciB2ZXJzaW9ucyIpLgoKU2lnbmVkLW9mZi1ieTogSsOpcsO0bWUgR2xp
c3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1
YmJhcmRAbnZpZGlhLmNvbT4KQ2M6IGxpbnV4LWZzZGV2ZWxAdmdlci5rZXJuZWwub3JnCkNjOiBs
aW51eC1ibG9ja0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzogdjlm
cy1kZXZlbG9wZXJAbGlzdHMuc291cmNlZm9yZ2UubmV0CkNjOiBKYW4gS2FyYSA8amFja0BzdXNl
LmN6PgpDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CkNjOiBBbGV4
YW5kZXIgVmlybyA8dmlyb0B6ZW5pdi5saW51eC5vcmcudWs+CkNjOiBKb2hhbm5lcyBUaHVtc2hp
cm4gPGp0aHVtc2hpcm5Ac3VzZS5kZT4KQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
PgpDYzogSmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRrPgpDYzogTWluZyBMZWkgPG1pbmcubGVp
QHJlZGhhdC5jb20+CkNjOiBEYXZlIENoaW5uZXIgPGRhdmlkQGZyb21vcmJpdC5jb20+CkNjOiBK
YXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBp
bmZyYWRlYWQub3JnPgpDYzogQm9heiBIYXJyb3NoIDxib2F6QHBsZXhpc3Rvci5jb20+CkNjOiBF
cmljIFZhbiBIZW5zYmVyZ2VuIDxlcmljdmhAZ21haWwuY29tPgpDYzogTGF0Y2hlc2FyIElvbmtv
diA8bHVjaG9AaW9ua292Lm5ldD4KQ2M6IERvbWluaXF1ZSBNYXJ0aW5ldCA8YXNtYWRldXNAY29k
ZXdyZWNrLm9yZz4KLS0tCiBuZXQvOXAvdHJhbnNfY29tbW9uLmMgfCAxNCArKysrKysrKysrLS0t
LQogbmV0LzlwL3RyYW5zX2NvbW1vbi5oIHwgIDMgKystCiBuZXQvOXAvdHJhbnNfdmlydGlvLmMg
fCAxOCArKysrKysrKysrKysrLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygr
KSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbmV0LzlwL3RyYW5zX2NvbW1vbi5jIGIv
bmV0LzlwL3RyYW5zX2NvbW1vbi5jCmluZGV4IDNkZmY2OGYwNWZiOS4uZTVjMzU5YzM2OWE2IDEw
MDY0NAotLS0gYS9uZXQvOXAvdHJhbnNfY29tbW9uLmMKKysrIGIvbmV0LzlwL3RyYW5zX2NvbW1v
bi5jCkBAIC0xOSwxMiArMTksMTggQEAKIC8qKgogICogIHA5X3JlbGVhc2VfcGFnZXMgLSBSZWxl
YXNlIHBhZ2VzIGFmdGVyIHRoZSB0cmFuc2FjdGlvbi4KICAqLwotdm9pZCBwOV9yZWxlYXNlX3Bh
Z2VzKHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCBucl9wYWdlcykKK3ZvaWQgcDlfcmVsZWFzZV9w
YWdlcyhzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgbnJfcGFnZXMsIGJvb2wgZnJvbV9ndXApCiB7
CiAJaW50IGk7CiAKLQlmb3IgKGkgPSAwOyBpIDwgbnJfcGFnZXM7IGkrKykKLQkJaWYgKHBhZ2Vz
W2ldKQotCQkJcHV0X3BhZ2UocGFnZXNbaV0pOworCWlmIChmcm9tX2d1cCkgeworCQlmb3IgKGkg
PSAwOyBpIDwgbnJfcGFnZXM7IGkrKykKKwkJCWlmIChwYWdlc1tpXSkKKwkJCQlwdXRfdXNlcl9w
YWdlKHBhZ2VzW2ldKTsKKwl9IGVsc2UgeworCQlmb3IgKGkgPSAwOyBpIDwgbnJfcGFnZXM7IGkr
KykKKwkJCWlmIChwYWdlc1tpXSkKKwkJCQlwdXRfcGFnZShwYWdlc1tpXSk7CisJfQogfQogRVhQ
T1JUX1NZTUJPTChwOV9yZWxlYXNlX3BhZ2VzKTsKZGlmZiAtLWdpdCBhL25ldC85cC90cmFuc19j
b21tb24uaCBiL25ldC85cC90cmFuc19jb21tb24uaAppbmRleCBjNDNiYWJiM2Y2MzUuLmRjZjAy
NTg2NzMxNCAxMDA2NDQKLS0tIGEvbmV0LzlwL3RyYW5zX2NvbW1vbi5oCisrKyBiL25ldC85cC90
cmFuc19jb21tb24uaApAQCAtMTIsNCArMTIsNSBAQAogICoKICAqLwogCi12b2lkIHA5X3JlbGVh
c2VfcGFnZXMoc3RydWN0IHBhZ2UgKiosIGludCk7Cit2b2lkIHA5X3JlbGVhc2VfcGFnZXMoc3Ry
dWN0IHBhZ2UgKipwYWdlcywgaW50IG5yX3BhZ2VzLCBib29sIGZyb21fZ3VwKTsKKwpkaWZmIC0t
Z2l0IGEvbmV0LzlwL3RyYW5zX3ZpcnRpby5jIGIvbmV0LzlwL3RyYW5zX3ZpcnRpby5jCmluZGV4
IGEzY2Q5MGE3NDAxMi4uMzcxNGNhNWVjZGMyIDEwMDY0NAotLS0gYS9uZXQvOXAvdHJhbnNfdmly
dGlvLmMKKysrIGIvbmV0LzlwL3RyYW5zX3ZpcnRpby5jCkBAIC0zMDYsMTEgKzMwNiwxNCBAQCBz
dGF0aWMgaW50IHA5X2dldF9tYXBwZWRfcGFnZXMoc3RydWN0IHZpcnRpb19jaGFuICpjaGFuLAog
CQkJICAgICAgIHN0cnVjdCBpb3ZfaXRlciAqZGF0YSwKIAkJCSAgICAgICBpbnQgY291bnQsCiAJ
CQkgICAgICAgc2l6ZV90ICpvZmZzLAotCQkJICAgICAgIGludCAqbmVlZF9kcm9wKQorCQkJICAg
ICAgIGludCAqbmVlZF9kcm9wLAorCQkJICAgICAgIGJvb2wgKmZyb21fZ3VwKQogewogCWludCBu
cl9wYWdlczsKIAlpbnQgZXJyOwogCisJKmZyb21fZ3VwID0gZmFsc2U7CisKIAlpZiAoIWlvdl9p
dGVyX2NvdW50KGRhdGEpKQogCQlyZXR1cm4gMDsKIApAQCAtMzMyLDYgKzMzNSw3IEBAIHN0YXRp
YyBpbnQgcDlfZ2V0X21hcHBlZF9wYWdlcyhzdHJ1Y3QgdmlydGlvX2NoYW4gKmNoYW4sCiAJCSpu
ZWVkX2Ryb3AgPSAxOwogCQlucl9wYWdlcyA9IERJVl9ST1VORF9VUChuICsgKm9mZnMsIFBBR0Vf
U0laRSk7CiAJCWF0b21pY19hZGQobnJfcGFnZXMsICZ2cF9waW5uZWQpOworCQkqZnJvbV9ndXAg
PSBpb3ZfaXRlcl9nZXRfcGFnZXNfdXNlX2d1cChkYXRhKTsKIAkJcmV0dXJuIG47CiAJfSBlbHNl
IHsKIAkJLyoga2VybmVsIGJ1ZmZlciwgbm8gbmVlZCB0byBwaW4gcGFnZXMgKi8KQEAgLTM5Nywx
MyArNDAxLDE1IEBAIHA5X3ZpcnRpb196Y19yZXF1ZXN0KHN0cnVjdCBwOV9jbGllbnQgKmNsaWVu
dCwgc3RydWN0IHA5X3JlcV90ICpyZXEsCiAJc2l6ZV90IG9mZnM7CiAJaW50IG5lZWRfZHJvcCA9
IDA7CiAJaW50IGtpY2tlZCA9IDA7CisJYm9vbCBpbl9mcm9tX2d1cCwgb3V0X2Zyb21fZ3VwOwog
CiAJcDlfZGVidWcoUDlfREVCVUdfVFJBTlMsICJ2aXJ0aW8gcmVxdWVzdFxuIik7CiAKIAlpZiAo
dW9kYXRhKSB7CiAJCV9fbGUzMiBzejsKIAkJaW50IG4gPSBwOV9nZXRfbWFwcGVkX3BhZ2VzKGNo
YW4sICZvdXRfcGFnZXMsIHVvZGF0YSwKLQkJCQkJICAgIG91dGxlbiwgJm9mZnMsICZuZWVkX2Ry
b3ApOworCQkJCQkgICAgb3V0bGVuLCAmb2ZmcywgJm5lZWRfZHJvcCwKKwkJCQkJICAgICZvdXRf
ZnJvbV9ndXApOwogCQlpZiAobiA8IDApIHsKIAkJCWVyciA9IG47CiAJCQlnb3RvIGVycl9vdXQ7
CkBAIC00MjIsNyArNDI4LDggQEAgcDlfdmlydGlvX3pjX3JlcXVlc3Qoc3RydWN0IHA5X2NsaWVu
dCAqY2xpZW50LCBzdHJ1Y3QgcDlfcmVxX3QgKnJlcSwKIAkJbWVtY3B5KCZyZXEtPnRjLnNkYXRh
WzBdLCAmc3osIHNpemVvZihzeikpOwogCX0gZWxzZSBpZiAodWlkYXRhKSB7CiAJCWludCBuID0g
cDlfZ2V0X21hcHBlZF9wYWdlcyhjaGFuLCAmaW5fcGFnZXMsIHVpZGF0YSwKLQkJCQkJICAgIGlu
bGVuLCAmb2ZmcywgJm5lZWRfZHJvcCk7CisJCQkJCSAgICBpbmxlbiwgJm9mZnMsICZuZWVkX2Ry
b3AsCisJCQkJCSAgICAmaW5fZnJvbV9ndXApOwogCQlpZiAobiA8IDApIHsKIAkJCWVyciA9IG47
CiAJCQlnb3RvIGVycl9vdXQ7CkBAIC01MDQsMTEgKzUxMSwxMiBAQCBwOV92aXJ0aW9femNfcmVx
dWVzdChzdHJ1Y3QgcDlfY2xpZW50ICpjbGllbnQsIHN0cnVjdCBwOV9yZXFfdCAqcmVxLAogZXJy
X291dDoKIAlpZiAobmVlZF9kcm9wKSB7CiAJCWlmIChpbl9wYWdlcykgewotCQkJcDlfcmVsZWFz
ZV9wYWdlcyhpbl9wYWdlcywgaW5fbnJfcGFnZXMpOworCQkJcDlfcmVsZWFzZV9wYWdlcyhpbl9w
YWdlcywgaW5fbnJfcGFnZXMsIGluX2Zyb21fZ3VwKTsKIAkJCWF0b21pY19zdWIoaW5fbnJfcGFn
ZXMsICZ2cF9waW5uZWQpOwogCQl9CiAJCWlmIChvdXRfcGFnZXMpIHsKLQkJCXA5X3JlbGVhc2Vf
cGFnZXMob3V0X3BhZ2VzLCBvdXRfbnJfcGFnZXMpOworCQkJcDlfcmVsZWFzZV9wYWdlcyhvdXRf
cGFnZXMsIG91dF9ucl9wYWdlcywKKwkJCQkJIG91dF9mcm9tX2d1cCk7CiAJCQlhdG9taWNfc3Vi
KG91dF9ucl9wYWdlcywgJnZwX3Bpbm5lZCk7CiAJCX0KIAkJLyogd2FrZXVwIGFueWJvZHkgd2Fp
dGluZyBmb3Igc2xvdHMgdG8gcGluIHBhZ2VzICovCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
