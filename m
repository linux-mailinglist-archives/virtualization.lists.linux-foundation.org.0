Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2D77373D
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:04:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7EAE314C1;
	Wed, 24 Jul 2019 18:59:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6FBD5D90
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9F856224
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:31 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id w24so21465467plp.2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 21:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BJP8QYXxp7VfUt7Eaw5PwJTw08pU7M/uVeuocSBpfVU=;
	b=JkQ04mWEAa/01zFb0tlIM6Uj/lB55wPCkF6GMvnL5gHq24gOeLxpu2syudv1ZeubVR
	o/2/SbGfs0MBuqHwUIG/UqiIYwjvwRdM1smByZv+PMbXD0dTKJlqPSntSI4p9XbD0/EP
	dCEFzTMQ+3jKQsrfKqZebfyOsyegrsrPG3hntSrqUGy/c3DI5jDFIn00D4+KacGWHwyg
	5+f61ycblG2ySUuAZOjASXUKEg6G7NHj0n1tTzQ86l9qr5EKD1HA2V/yosWmHzLAWWAj
	WxbUEPr8ZwbT/LJAb0AztRPHVuEiMh11F1nlDvqA1UHHjZuRTFB0keSEGorINX0fFgb2
	sO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BJP8QYXxp7VfUt7Eaw5PwJTw08pU7M/uVeuocSBpfVU=;
	b=C8liVio7qwdX1fAbtcHCrpazxmESlcSTPWqhx3yUJvL1lOP5k2eZiEBhuZ6iS43HL9
	F/5040zeSw0VEwYMbWN3yjHslbFVun+k7J4RKpwSDWtsc++L4mSkoLmgn3pATQQUpZmM
	24Q0f2yZP/k6Eqxl5j+5XWjKJKfM2vvVgSRkEFo0YIUD4Q3M6AVMHHHAIfbzkQO12tXF
	huBte80Y0K4vbXTyTXhXSeYpDOvGUd7hVmybzpWT7xBrabw2qbKb7jf/5SGvSMQoNAVh
	B2ICtXFD4EOMEswGSoYkIkaEkzNa5C65n0mT4QODZzx2IjlaCk6lV9I6b8jw+cXYAN6O
	3lbg==
X-Gm-Message-State: APjAAAXC2Oob8k2Bq7mgGJWY8gh9TFT9Fl6FIanaWOFUGNOJQ4xUrkqU
	nwhbNs7KsS26DefWz25f6Fo=
X-Google-Smtp-Source: APXvYqwp+g/SqY8cK+RhyrKnPd9NNEiEh2F/BoaBOdfDPn2MZtzIjgPt3GPtA4VFQfpQXahpL/YYYg==
X-Received: by 2002:a17:902:ac85:: with SMTP id
	h5mr84794603plr.198.1563942331371; 
	Tue, 23 Jul 2019 21:25:31 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
	by smtp.gmail.com with ESMTPSA id
	a15sm34153364pgw.3.2019.07.23.21.25.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 21:25:30 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 07/12] vhost-scsi: convert put_page() to put_user_page*()
Date: Tue, 23 Jul 2019 21:25:13 -0700
Message-Id: <20190724042518.14363-8-jhubbard@nvidia.com>
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
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Hajnoczi <stefanha@redhat.com>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, samba-technical@lists.samba.org,
	LKML <linux-kernel@vger.kernel.org>,
	"David S . Miller" <davem@davemloft.net>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
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
Z2luYWwgcGF0Y2g6CgoqIENoYW5nZWQgYSBXQVJOX09OIHRvIGEgQlVHX09OLgoKU2lnbmVkLW9m
Zi1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6
IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KQ2M6IHZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCkNjOiBsaW51eC1mc2RldmVsQHZnZXIua2VybmVsLm9y
ZwpDYzogbGludXgtYmxvY2tAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1tbUBrdmFjay5vcmcK
Q2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxp
YW1zQGludGVsLmNvbT4KQ2M6IEFsZXhhbmRlciBWaXJvIDx2aXJvQHplbml2LmxpbnV4Lm9yZy51
az4KQ2M6IEpvaGFubmVzIFRodW1zaGlybiA8anRodW1zaGlybkBzdXNlLmRlPgpDYzogQ2hyaXN0
b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CkNjOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+
CkNjOiBNaW5nIExlaSA8bWluZy5sZWlAcmVkaGF0LmNvbT4KQ2M6IERhdmUgQ2hpbm5lciA8ZGF2
aWRAZnJvbW9yYml0LmNvbT4KQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgpDYzog
TWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+CkNjOiBCb2F6IEhhcnJvc2ggPGJv
YXpAcGxleGlzdG9yLmNvbT4KQ2M6IE1pa2xvcyBTemVyZWRpIDxtaWtsb3NAc3plcmVkaS5odT4K
Q2M6ICJNaWNoYWVsIFMuIFRzaXJraW4iIDxtc3RAcmVkaGF0LmNvbT4KQ2M6IEphc29uIFdhbmcg
PGphc293YW5nQHJlZGhhdC5jb20+CkNjOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQu
Y29tPgpDYzogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIGRyaXZl
cnMvdmhvc3Qvc2NzaS5jIHwgMTMgKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC9z
Y3NpLmMgYi9kcml2ZXJzL3Zob3N0L3Njc2kuYwppbmRleCBhOWNhZjFiYzNjM2UuLjI4MjU2NWFi
NWUzZiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aG9zdC9zY3NpLmMKKysrIGIvZHJpdmVycy92aG9z
dC9zY3NpLmMKQEAgLTMyOSwxMSArMzI5LDExIEBAIHN0YXRpYyB2b2lkIHZob3N0X3Njc2lfcmVs
ZWFzZV9jbWQoc3RydWN0IHNlX2NtZCAqc2VfY21kKQogCiAJaWYgKHR2X2NtZC0+dHZjX3NnbF9j
b3VudCkgewogCQlmb3IgKGkgPSAwOyBpIDwgdHZfY21kLT50dmNfc2dsX2NvdW50OyBpKyspCi0J
CQlwdXRfcGFnZShzZ19wYWdlKCZ0dl9jbWQtPnR2Y19zZ2xbaV0pKTsKKwkJCXB1dF91c2VyX3Bh
Z2Uoc2dfcGFnZSgmdHZfY21kLT50dmNfc2dsW2ldKSk7CiAJfQogCWlmICh0dl9jbWQtPnR2Y19w
cm90X3NnbF9jb3VudCkgewogCQlmb3IgKGkgPSAwOyBpIDwgdHZfY21kLT50dmNfcHJvdF9zZ2xf
Y291bnQ7IGkrKykKLQkJCXB1dF9wYWdlKHNnX3BhZ2UoJnR2X2NtZC0+dHZjX3Byb3Rfc2dsW2ld
KSk7CisJCQlwdXRfdXNlcl9wYWdlKHNnX3BhZ2UoJnR2X2NtZC0+dHZjX3Byb3Rfc2dsW2ldKSk7
CiAJfQogCiAJdmhvc3Rfc2NzaV9wdXRfaW5mbGlnaHQodHZfY21kLT5pbmZsaWdodCk7CkBAIC02
MzAsNiArNjMwLDEzIEBAIHZob3N0X3Njc2lfbWFwX3RvX3NnbChzdHJ1Y3Qgdmhvc3Rfc2NzaV9j
bWQgKmNtZCwKIAlzaXplX3Qgb2Zmc2V0OwogCXVuc2lnbmVkIGludCBucGFnZXMgPSAwOwogCisJ
LyoKKwkgKiBIZXJlIGluIGFsbCBjYXNlcyB3ZSBzaG91bGQgaGF2ZSBhbiBJT1ZFQyB3aGljaCB1
c2UgR1VQLiBJZiB0aGF0IGlzCisJICogbm90IHRoZSBjYXNlIHRoZW4gd2Ugd2lsbCB3cm9uZ2x5
IGNhbGwgcHV0X3VzZXJfcGFnZSgpIGFuZCB0aGUgcGFnZQorCSAqIHJlZmNvdW50IHdpbGwgZ28g
d3JvbmcgKHRoaXMgaXMgaW4gdmhvc3Rfc2NzaV9yZWxlYXNlX2NtZCgpKQorCSAqLworCVdBUk5f
T04oIWlvdl9pdGVyX2dldF9wYWdlc191c2VfZ3VwKGl0ZXIpKTsKKwogCWJ5dGVzID0gaW92X2l0
ZXJfZ2V0X3BhZ2VzKGl0ZXIsIHBhZ2VzLCBMT05HX01BWCwKIAkJCQlWSE9TVF9TQ1NJX1BSRUFM
TE9DX1VQQUdFUywgJm9mZnNldCk7CiAJLyogTm8gcGFnZXMgd2VyZSBwaW5uZWQgKi8KQEAgLTY4
MSw3ICs2ODgsNyBAQCB2aG9zdF9zY3NpX2lvdl90b19zZ2woc3RydWN0IHZob3N0X3Njc2lfY21k
ICpjbWQsIGJvb2wgd3JpdGUsCiAJCQl3aGlsZSAocCA8IHNnKSB7CiAJCQkJc3RydWN0IHBhZ2Ug
KnBhZ2UgPSBzZ19wYWdlKHArKyk7CiAJCQkJaWYgKHBhZ2UpCi0JCQkJCXB1dF9wYWdlKHBhZ2Up
OworCQkJCQlwdXRfdXNlcl9wYWdlKHBhZ2UpOwogCQkJfQogCQkJcmV0dXJuIHJldDsKIAkJfQot
LSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vdmlydHVhbGl6YXRpb24=
