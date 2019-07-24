Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC4A7373E
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:04:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BC2D0141E;
	Wed, 24 Jul 2019 18:59:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1B477CC4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3F31D224
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:33 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id n9so14286648pgc.1
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 21:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KSu4c8K87otioLO5Qi7krPYXd9lfPqD3DBn+R95C1d0=;
	b=vK9pooKon6/mOtb3SY3teg2KToasteUZ4QJ6ySDYhY+bolLRcoJ0V7EApmOF6ww8+5
	uA5XzDj5MgYzDTTUihWBvQPudQbRA6pP0Np2RjOxAW+25aABpMhwK96bgYN77XodLsbz
	TjJmoxROhxmbYmas70jZF8oQ9Vvbm2huGu9ybaSW1Ge8TFjgZCxQqbtBWvoBjF//tpwO
	vlXCDNjVvcKyqLnAYMUPy1UP+NivsNAfedccjedMaIPaHnlBhFEHQeh7YTlVhbGBE4Ft
	9r/ZEWoW7VQgYw3mrzI+TQqbyaEji4PuYSqkM7tx8/3qaXyX/w+rFyy3S1NH5tXtFcGX
	418w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KSu4c8K87otioLO5Qi7krPYXd9lfPqD3DBn+R95C1d0=;
	b=eVGh4YvpxejqMdG9j1T07JVNHDlBkMGTVeaNNtEzpRcoVbrOwp0Iv3CDpdJV3LQsSe
	12byWigWcGvtCWe+q0hAImhO145luCtRtGYXAnKjLDg+34JhrIvR6HJhKLftwJFm6Agz
	j5JiIX5vYehoDyCMVoRPttRtWqPaOxKnMapDqvzx+Lt7N06SRoZjsPZ4hCjHamyB8dYU
	x03SzKQLWxJ2vLwNhO9gNAeQ0wotzstmEnpdJe9WT3VJjFH8jI5tnZSt4dOSPwKx2HaY
	XLUPlkVNYjmznyUNyD5m+UykKSxlpR0Illq9VV+tQtIAYnFNpezw3/pA6O2zpv/0XXUY
	mGIg==
X-Gm-Message-State: APjAAAWuBgYXpQJtzpYojN8c/P296G/1Fr7a+0KMhR0u2bWNi6McLau9
	WGY9iBB34Vmi6xdjCSSPv74=
X-Google-Smtp-Source: APXvYqxBFutwlAV+HAhH1stPSp3r5XPR8jEYK6DoryZdcZaAiPzxQPw8sNObOsdod3FjgjrDKk14TQ==
X-Received: by 2002:a17:90a:1b48:: with SMTP id
	q66mr82032950pjq.83.1563942332936; 
	Tue, 23 Jul 2019 21:25:32 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
	by smtp.gmail.com with ESMTPSA id
	a15sm34153364pgw.3.2019.07.23.21.25.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 21:25:32 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 08/12] fs/cifs: convert put_page() to put_user_page*()
Date: Tue, 23 Jul 2019 21:25:14 -0700
Message-Id: <20190724042518.14363-9-jhubbard@nvidia.com>
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
	"David S . Miller" <davem@davemloft.net>,
	Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
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
aW51eC1ibG9ja0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzogbGlu
dXgtY2lmc0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBE
YW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IEFsZXhhbmRlciBWaXJv
IDx2aXJvQHplbml2LmxpbnV4Lm9yZy51az4KQ2M6IEpvaGFubmVzIFRodW1zaGlybiA8anRodW1z
aGlybkBzdXNlLmRlPgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CkNjOiBKZW5z
IEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+CkNjOiBNaW5nIExlaSA8bWluZy5sZWlAcmVkaGF0LmNv
bT4KQ2M6IERhdmUgQ2hpbm5lciA8ZGF2aWRAZnJvbW9yYml0LmNvbT4KQ2M6IEphc29uIEd1bnRo
b3JwZSA8amdnQHppZXBlLmNhPgpDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5v
cmc+CkNjOiBCb2F6IEhhcnJvc2ggPGJvYXpAcGxleGlzdG9yLmNvbT4KQ2M6IFN0ZXZlIEZyZW5j
aCA8c2ZyZW5jaEBzYW1iYS5vcmc+Ci0tLQogZnMvY2lmcy9jaWZzZ2xvYi5oIHwgIDMgKysrCiBm
cy9jaWZzL2ZpbGUuYyAgICAgfCAyMiArKysrKysrKysrKysrKysrKy0tLS0tCiBmcy9jaWZzL21p
c2MuYyAgICAgfCAxOSArKysrKysrKysrKysrKystLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDM1IGlu
c2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvY2lmcy9jaWZzZ2xv
Yi5oIGIvZnMvY2lmcy9jaWZzZ2xvYi5oCmluZGV4IGZlNjEwZTdlMzY3MC4uZTk1Y2I4MmJmYTUw
IDEwMDY0NAotLS0gYS9mcy9jaWZzL2NpZnNnbG9iLmgKKysrIGIvZnMvY2lmcy9jaWZzZ2xvYi5o
CkBAIC0xMjgzLDYgKzEyODMsNyBAQCBzdHJ1Y3QgY2lmc19haW9fY3R4IHsKIAkgKiBJZiB5ZXMs
IGl0ZXIgaXMgYSBjb3B5IG9mIHRoZSB1c2VyIHBhc3NlZCBpb3ZfaXRlcgogCSAqLwogCWJvb2wJ
CQlkaXJlY3RfaW87CisJYm9vbAkJCWZyb21fZ3VwOwogfTsKIAogc3RydWN0IGNpZnNfcmVhZGRh
dGE7CkBAIC0xMzE3LDYgKzEzMTgsNyBAQCBzdHJ1Y3QgY2lmc19yZWFkZGF0YSB7CiAJc3RydWN0
IGNpZnNfY3JlZGl0cwkJY3JlZGl0czsKIAl1bnNpZ25lZCBpbnQJCQlucl9wYWdlczsKIAlzdHJ1
Y3QgcGFnZQkJCSoqcGFnZXM7CisJYm9vbAkJCQlmcm9tX2d1cDsKIH07CiAKIHN0cnVjdCBjaWZz
X3dyaXRlZGF0YTsKQEAgLTEzNDMsNiArMTM0NSw3IEBAIHN0cnVjdCBjaWZzX3dyaXRlZGF0YSB7
CiAJc3RydWN0IGNpZnNfY3JlZGl0cwkJY3JlZGl0czsKIAl1bnNpZ25lZCBpbnQJCQlucl9wYWdl
czsKIAlzdHJ1Y3QgcGFnZQkJCSoqcGFnZXM7CisJYm9vbAkJCQlmcm9tX2d1cDsKIH07CiAKIC8q
CmRpZmYgLS1naXQgYS9mcy9jaWZzL2ZpbGUuYyBiL2ZzL2NpZnMvZmlsZS5jCmluZGV4IDk3MDkw
NjkzZDE4Mi4uODRmYTdlMGE1NzhmIDEwMDY0NAotLS0gYS9mcy9jaWZzL2ZpbGUuYworKysgYi9m
cy9jaWZzL2ZpbGUuYwpAQCAtMjU3MSw4ICsyNTcxLDEzIEBAIGNpZnNfdW5jYWNoZWRfd3JpdGVk
YXRhX3JlbGVhc2Uoc3RydWN0IGtyZWYgKnJlZmNvdW50KQogCQkJCQlzdHJ1Y3QgY2lmc193cml0
ZWRhdGEsIHJlZmNvdW50KTsKIAogCWtyZWZfcHV0KCZ3ZGF0YS0+Y3R4LT5yZWZjb3VudCwgY2lm
c19haW9fY3R4X3JlbGVhc2UpOwotCWZvciAoaSA9IDA7IGkgPCB3ZGF0YS0+bnJfcGFnZXM7IGkr
KykKLQkJcHV0X3BhZ2Uod2RhdGEtPnBhZ2VzW2ldKTsKKwlpZiAod2RhdGEtPmZyb21fZ3VwKSB7
CisJCWZvciAoaSA9IDA7IGkgPCB3ZGF0YS0+bnJfcGFnZXM7IGkrKykKKwkJCXB1dF91c2VyX3Bh
Z2Uod2RhdGEtPnBhZ2VzW2ldKTsKKwl9IGVsc2UgeworCQlmb3IgKGkgPSAwOyBpIDwgd2RhdGEt
Pm5yX3BhZ2VzOyBpKyspCisJCQlwdXRfcGFnZSh3ZGF0YS0+cGFnZXNbaV0pOworCX0KIAljaWZz
X3dyaXRlZGF0YV9yZWxlYXNlKHJlZmNvdW50KTsKIH0KIApAQCAtMjc4MSw3ICsyNzg2LDcgQEAg
Y2lmc193cml0ZV9mcm9tX2l0ZXIobG9mZl90IG9mZnNldCwgc2l6ZV90IGxlbiwgc3RydWN0IGlv
dl9pdGVyICpmcm9tLAogCQkJCWJyZWFrOwogCQkJfQogCi0KKwkJCXdkYXRhLT5mcm9tX2d1cCA9
IGlvdl9pdGVyX2dldF9wYWdlc191c2VfZ3VwKGZyb20pOwogCQkJd2RhdGEtPnBhZ2Vfb2Zmc2V0
ID0gc3RhcnQ7CiAJCQl3ZGF0YS0+dGFpbHN6ID0KIAkJCQlucl9wYWdlcyA+IDEgPwpAQCAtMjc5
Nyw2ICsyODAyLDcgQEAgY2lmc193cml0ZV9mcm9tX2l0ZXIobG9mZl90IG9mZnNldCwgc2l6ZV90
IGxlbiwgc3RydWN0IGlvdl9pdGVyICpmcm9tLAogCQkJCWFkZF9jcmVkaXRzX2FuZF93YWtlX2lm
KHNlcnZlciwgY3JlZGl0cywgMCk7CiAJCQkJYnJlYWs7CiAJCQl9CisJCQl3ZGF0YS0+ZnJvbV9n
dXAgPSBmYWxzZTsKIAogCQkJcmMgPSBjaWZzX3dyaXRlX2FsbG9jYXRlX3BhZ2VzKHdkYXRhLT5w
YWdlcywgbnJfcGFnZXMpOwogCQkJaWYgKHJjKSB7CkBAIC0zMjM4LDggKzMyNDQsMTIgQEAgY2lm
c191bmNhY2hlZF9yZWFkZGF0YV9yZWxlYXNlKHN0cnVjdCBrcmVmICpyZWZjb3VudCkKIAl1bnNp
Z25lZCBpbnQgaTsKIAogCWtyZWZfcHV0KCZyZGF0YS0+Y3R4LT5yZWZjb3VudCwgY2lmc19haW9f
Y3R4X3JlbGVhc2UpOwotCWZvciAoaSA9IDA7IGkgPCByZGF0YS0+bnJfcGFnZXM7IGkrKykgewot
CQlwdXRfcGFnZShyZGF0YS0+cGFnZXNbaV0pOworCWlmIChyZGF0YS0+ZnJvbV9ndXApIHsKKwkJ
Zm9yIChpID0gMDsgaSA8IHJkYXRhLT5ucl9wYWdlczsgaSsrKQorCQkJcHV0X3VzZXJfcGFnZShy
ZGF0YS0+cGFnZXNbaV0pOworCX0gZWxzZSB7CisJCWZvciAoaSA9IDA7IGkgPCByZGF0YS0+bnJf
cGFnZXM7IGkrKykKKwkJCXB1dF9wYWdlKHJkYXRhLT5wYWdlc1tpXSk7CiAJfQogCWNpZnNfcmVh
ZGRhdGFfcmVsZWFzZShyZWZjb3VudCk7CiB9CkBAIC0zNTAyLDYgKzM1MTIsNyBAQCBjaWZzX3Nl
bmRfYXN5bmNfcmVhZChsb2ZmX3Qgb2Zmc2V0LCBzaXplX3QgbGVuLCBzdHJ1Y3QgY2lmc0ZpbGVJ
bmZvICpvcGVuX2ZpbGUsCiAJCQkJYnJlYWs7CiAJCQl9CiAKKwkJCXJkYXRhLT5mcm9tX2d1cCA9
IGlvdl9pdGVyX2dldF9wYWdlc191c2VfZ3VwKCZkaXJlY3RfaW92KTsKIAkJCW5wYWdlcyA9IChj
dXJfbGVuICsgc3RhcnQgKyBQQUdFX1NJWkUtMSkgLyBQQUdFX1NJWkU7CiAJCQlyZGF0YS0+cGFn
ZV9vZmZzZXQgPSBzdGFydDsKIAkJCXJkYXRhLT50YWlsc3ogPSBucGFnZXMgPiAxID8KQEAgLTM1
MTksNiArMzUzMCw3IEBAIGNpZnNfc2VuZF9hc3luY19yZWFkKGxvZmZfdCBvZmZzZXQsIHNpemVf
dCBsZW4sIHN0cnVjdCBjaWZzRmlsZUluZm8gKm9wZW5fZmlsZSwKIAkJCQlyYyA9IC1FTk9NRU07
CiAJCQkJYnJlYWs7CiAJCQl9CisJCQlyZGF0YS0+ZnJvbV9ndXAgPSBmYWxzZTsKIAogCQkJcmMg
PSBjaWZzX3JlYWRfYWxsb2NhdGVfcGFnZXMocmRhdGEsIG5wYWdlcyk7CiAJCQlpZiAocmMpIHsK
ZGlmZiAtLWdpdCBhL2ZzL2NpZnMvbWlzYy5jIGIvZnMvY2lmcy9taXNjLmMKaW5kZXggZjM4Mzg3
N2E2NTExLi41YTA0YzM0ZmVhMDUgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvbWlzYy5jCisrKyBiL2Zz
L2NpZnMvbWlzYy5jCkBAIC04MjIsMTAgKzgyMiwxOCBAQCBjaWZzX2Fpb19jdHhfcmVsZWFzZShz
dHJ1Y3Qga3JlZiAqcmVmY291bnQpCiAJaWYgKGN0eC0+YnYpIHsKIAkJdW5zaWduZWQgaTsKIAot
CQlmb3IgKGkgPSAwOyBpIDwgY3R4LT5ucGFnZXM7IGkrKykgewotCQkJaWYgKGN0eC0+c2hvdWxk
X2RpcnR5KQotCQkJCXNldF9wYWdlX2RpcnR5KGN0eC0+YnZbaV0uYnZfcGFnZSk7Ci0JCQlwdXRf
cGFnZShjdHgtPmJ2W2ldLmJ2X3BhZ2UpOworCQlpZiAoY3R4LT5mcm9tX2d1cCkgeworCQkJZm9y
IChpID0gMDsgaSA8IGN0eC0+bnBhZ2VzOyBpKyspIHsKKwkJCQlpZiAoY3R4LT5zaG91bGRfZGly
dHkpCisJCQkJCXNldF9wYWdlX2RpcnR5KGN0eC0+YnZbaV0uYnZfcGFnZSk7CisJCQkJcHV0X3Vz
ZXJfcGFnZShjdHgtPmJ2W2ldLmJ2X3BhZ2UpOworCQkJfQorCQl9IGVsc2UgeworCQkJZm9yIChp
ID0gMDsgaSA8IGN0eC0+bnBhZ2VzOyBpKyspIHsKKwkJCQlpZiAoY3R4LT5zaG91bGRfZGlydHkp
CisJCQkJCXNldF9wYWdlX2RpcnR5KGN0eC0+YnZbaV0uYnZfcGFnZSk7CisJCQkJcHV0X3BhZ2Uo
Y3R4LT5idltpXS5idl9wYWdlKTsKKwkJCX0KIAkJfQogCQlrdmZyZWUoY3R4LT5idik7CiAJfQpA
QCAtODgxLDYgKzg4OSw5IEBAIHNldHVwX2Fpb19jdHhfaXRlcihzdHJ1Y3QgY2lmc19haW9fY3R4
ICpjdHgsIHN0cnVjdCBpb3ZfaXRlciAqaXRlciwgaW50IHJ3KQogCiAJc2F2ZWRfbGVuID0gY291
bnQ7CiAKKwkvKiBUaGlzIGlzIG9ubHkgdXNlIGJ5IGNpZnNfYWlvX2N0eF9yZWxlYXNlKCkgKi8K
KwljdHgtPmZyb21fZ3VwID0gaW92X2l0ZXJfZ2V0X3BhZ2VzX3VzZV9ndXAoaXRlcik7CisKIAl3
aGlsZSAoY291bnQgJiYgbnBhZ2VzIDwgbWF4X3BhZ2VzKSB7CiAJCXJjID0gaW92X2l0ZXJfZ2V0
X3BhZ2VzKGl0ZXIsIHBhZ2VzLCBjb3VudCwgbWF4X3BhZ2VzLCAmc3RhcnQpOwogCQlpZiAocmMg
PCAwKSB7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
