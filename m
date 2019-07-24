Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5657373B
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:03:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 028E31422;
	Wed, 24 Jul 2019 18:59:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6EF6FD95
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AC9FDFE
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:28 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id i2so21482640plt.1
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 21:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CtboR7Ufy9O9fDFcRIuCIk1t8EIvDdcqQ3tCIzPpVTU=;
	b=BFNUQlsly9hFNZnfDRf69ho0wDvCVUqoj8dGJpNcOiGYgy46obMbORHEMN/I5tUQuy
	K86xGPjY4b4QO+54v/Zv7nQ40O3fVB4kil84sULCnYrDgJVTXlsEFmALWYldAbZAgMBP
	fvIXv3sy0T/Ns+lBLfXM4dLPELbccf6aa9owKLeIZQZMk4ea+nMOdmYcBOB36dALtS4z
	0SnWHD/Ra8zQZlPYXX9NedMId4XeBIsKRL/2j4wXYAsw4ctlt6Th0vAum9effAlS+CNc
	g0HRax01vlO2YL0JWYjboqvm7PfjfxsTzbm2nbAhIfIebOVYGUr1FquaKAPIEQbTrE+e
	0YTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CtboR7Ufy9O9fDFcRIuCIk1t8EIvDdcqQ3tCIzPpVTU=;
	b=KOSGcqRLws/mBkgXDrbG1eMTx0/e/ZYogd4SErIzQit33gNm1U+G/YiQiGghdBgl2T
	Jnk8nA7hcsYrdCB+3jnaBAOwiQlxjwDfB+3wWG5+VkcX9GIep2X6NyqUQ+EocxoRSQ7y
	Ib4Xbo8uDrQMsgMbOhx7DNmolrSdDEzQ5z7b1At3iVWhcItBW9utn1u9wqb1dpknOG7V
	9ErcFcG/LmTXa2MUw1SLbLDPxCVodraSWnvL7oL5dPSRe8Fofr0rcEo1Y3RPKNSKtMcL
	xFUDj0/hvtnaicscxF4XijAXQ8GJbEohfJNNJMYCTU/g481+3bXmkqJ9HnzoQEB8yAzT
	v26Q==
X-Gm-Message-State: APjAAAWCPRPdoe89RA5+EsUh5tTslTHlFOSuw1sXQWheTWpVxElW8sA7
	5GazpC8hBCJqrKUoWyCqnY4=
X-Google-Smtp-Source: APXvYqw2fBb16YWxNCvrkJttPP2qps3nLx7+Bn7G811lLUhuqyz8ucaB8iJLC4by+I8yTQYjbx90Ag==
X-Received: by 2002:a17:902:2ec5:: with SMTP id
	r63mr82774537plb.21.1563942328383; 
	Tue, 23 Jul 2019 21:25:28 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
	by smtp.gmail.com with ESMTPSA id
	a15sm34153364pgw.3.2019.07.23.21.25.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 21:25:27 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 05/12] block_dev: convert put_page() to put_user_page*()
Date: Tue, 23 Jul 2019 21:25:11 -0700
Message-Id: <20190724042518.14363-6-jhubbard@nvidia.com>
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
dXRfcGFnZSgpIG9yCnJlbGVhc2VfcGFnZXMoKS4KClRoaXMgaXMgcGFydCBhIHRyZWUtd2lkZSBj
b252ZXJzaW9uLCBhcyBkZXNjcmliZWQgaW4gY29tbWl0IGZjMWQ4ZTdjY2EyZAooIm1tOiBpbnRy
b2R1Y2UgcHV0X3VzZXJfcGFnZSooKSwgcGxhY2Vob2xkZXIgdmVyc2lvbnMiKS4KCkNoYW5nZXMg
ZnJvbSBKw6lyw7RtZSdzIG9yaWdpbmFsIHBhdGNoOgoKKiByZXdvcmtlZCB0byBiZSBjb21wYXRp
YmxlIHdpdGggcmVjZW50IGJpb19yZWxlYXNlX3BhZ2VzKCkgY2hhbmdlcy4KClNpZ25lZC1vZmYt
Ynk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBK
b2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+CkNjOiBsaW51eC1mc2RldmVsQHZnZXIu
a2VybmVsLm9yZwpDYzogbGludXgtYmxvY2tAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1tbUBr
dmFjay5vcmcKQ2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBEYW4gV2lsbGlhbXMgPGRh
bi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IEFsZXhhbmRlciBWaXJvIDx2aXJvQHplbml2Lmxp
bnV4Lm9yZy51az4KQ2M6IEpvaGFubmVzIFRodW1zaGlybiA8anRodW1zaGlybkBzdXNlLmRlPgpD
YzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CkNjOiBKZW5zIEF4Ym9lIDxheGJvZUBr
ZXJuZWwuZGs+CkNjOiBNaW5nIExlaSA8bWluZy5sZWlAcmVkaGF0LmNvbT4KQ2M6IERhdmUgQ2hp
bm5lciA8ZGF2aWRAZnJvbW9yYml0LmNvbT4KQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBl
LmNhPgpDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+CkNjOiBCb2F6IEhh
cnJvc2ggPGJvYXpAcGxleGlzdG9yLmNvbT4KLS0tCiBibG9jay9iaW8uYyAgICAgICAgIHwgMTMg
KysrKysrKysrKysrKwogZnMvYmxvY2tfZGV2LmMgICAgICB8IDIyICsrKysrKysrKysrKysrKysr
LS0tLS0KIGluY2x1ZGUvbGludXgvYmlvLmggfCAgOCArKysrKysrKwogMyBmaWxlcyBjaGFuZ2Vk
LCAzOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Jsb2NrL2Jp
by5jIGIvYmxvY2svYmlvLmMKaW5kZXggNzRmOWViYTI1ODNiLi4zYjlmNjZlNjRiYzEgMTAwNjQ0
Ci0tLSBhL2Jsb2NrL2Jpby5jCisrKyBiL2Jsb2NrL2Jpby5jCkBAIC0xNzQ2LDYgKzE3NDYsMTkg
QEAgdm9pZCBiaW9fY2hlY2tfcGFnZXNfZGlydHkoc3RydWN0IGJpbyAqYmlvKQogCV9fYmlvX2No
ZWNrX3BhZ2VzX2RpcnR5KGJpbywgZmFsc2UpOwogfQogCitlbnVtIGJpb19ycF9mbGFnc190IGJp
b19ycF9mbGFncyhzdHJ1Y3QgaW92X2l0ZXIgKml0ZXIsIGJvb2wgbWFya19kaXJ0eSkKK3sKKwll
bnVtIGJpb19ycF9mbGFnc190IGZsYWdzID0gQklPX1JQX05PUk1BTDsKKworCWlmIChtYXJrX2Rp
cnR5KQorCQlmbGFncyB8PSBCSU9fUlBfTUFSS19ESVJUWTsKKworCWlmIChpb3ZfaXRlcl9nZXRf
cGFnZXNfdXNlX2d1cChpdGVyKSkKKwkJZmxhZ3MgfD0gQklPX1JQX0ZST01fR1VQOworCisJcmV0
dXJuIGZsYWdzOworfQorCiB2b2lkIHVwZGF0ZV9pb190aWNrcyhzdHJ1Y3QgaGRfc3RydWN0ICpw
YXJ0LCB1bnNpZ25lZCBsb25nIG5vdykKIHsKIAl1bnNpZ25lZCBsb25nIHN0YW1wOwpkaWZmIC0t
Z2l0IGEvZnMvYmxvY2tfZGV2LmMgYi9mcy9ibG9ja19kZXYuYwppbmRleCA5ZmU2NjE2Zjg3ODgu
LmQ1M2FiYWYzMWU1NCAxMDA2NDQKLS0tIGEvZnMvYmxvY2tfZGV2LmMKKysrIGIvZnMvYmxvY2tf
ZGV2LmMKQEAgLTI1OSw3ICsyNTksNyBAQCBfX2Jsa2Rldl9kaXJlY3RfSU9fc2ltcGxlKHN0cnVj
dCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICppdGVyLAogCX0KIAlfX3NldF9jdXJyZW50
X3N0YXRlKFRBU0tfUlVOTklORyk7CiAKLQliaW9fcmVsZWFzZV9wYWdlcygmYmlvLCBiaW9fcnBf
ZGlydHlfZmxhZyhzaG91bGRfZGlydHkpKTsKKwliaW9fcmVsZWFzZV9wYWdlcygmYmlvLCBiaW9f
cnBfZmxhZ3MoaXRlciwgc2hvdWxkX2RpcnR5KSk7CiAJaWYgKHVubGlrZWx5KGJpby5iaV9zdGF0
dXMpKQogCQlyZXQgPSBibGtfc3RhdHVzX3RvX2Vycm5vKGJpby5iaV9zdGF0dXMpOwogCkBAIC0y
OTUsNyArMjk1LDcgQEAgc3RhdGljIGludCBibGtkZXZfaW9wb2xsKHN0cnVjdCBraW9jYiAqa2lv
Y2IsIGJvb2wgd2FpdCkKIAlyZXR1cm4gYmxrX3BvbGwocSwgUkVBRF9PTkNFKGtpb2NiLT5raV9j
b29raWUpLCB3YWl0KTsKIH0KIAotc3RhdGljIHZvaWQgYmxrZGV2X2Jpb19lbmRfaW8oc3RydWN0
IGJpbyAqYmlvKQorc3RhdGljIHZvaWQgX2Jsa2Rldl9iaW9fZW5kX2lvKHN0cnVjdCBiaW8gKmJp
bywgYm9vbCBmcm9tX2d1cCkKIHsKIAlzdHJ1Y3QgYmxrZGV2X2RpbyAqZGlvID0gYmlvLT5iaV9w
cml2YXRlOwogCWJvb2wgc2hvdWxkX2RpcnR5ID0gZGlvLT5zaG91bGRfZGlydHk7CkBAIC0zMjcs
MTMgKzMyNywyMyBAQCBzdGF0aWMgdm9pZCBibGtkZXZfYmlvX2VuZF9pbyhzdHJ1Y3QgYmlvICpi
aW8pCiAJfQogCiAJaWYgKHNob3VsZF9kaXJ0eSkgewotCQliaW9fY2hlY2tfcGFnZXNfZGlydHko
YmlvKTsKKwkJX19iaW9fY2hlY2tfcGFnZXNfZGlydHkoYmlvLCBmcm9tX2d1cCk7CiAJfSBlbHNl
IHsKLQkJYmlvX3JlbGVhc2VfcGFnZXMoYmlvLCBCSU9fUlBfTk9STUFMKTsKKwkJYmlvX3JlbGVh
c2VfcGFnZXMoYmlvLCBiaW9fcnBfZ3VwX2ZsYWcoZnJvbV9ndXApKTsKIAkJYmlvX3B1dChiaW8p
OwogCX0KIH0KIAorc3RhdGljIHZvaWQgYmxrZGV2X2Jpb19lbmRfaW8oc3RydWN0IGJpbyAqYmlv
KQoreworCV9ibGtkZXZfYmlvX2VuZF9pbyhiaW8sIGZhbHNlKTsKK30KKworc3RhdGljIHZvaWQg
YmxrZGV2X2Jpb19mcm9tX2d1cF9lbmRfaW8oc3RydWN0IGJpbyAqYmlvKQoreworCV9ibGtkZXZf
YmlvX2VuZF9pbyhiaW8sIHRydWUpOworfQorCiBzdGF0aWMgc3NpemVfdAogX19ibGtkZXZfZGly
ZWN0X0lPKHN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICppdGVyLCBpbnQgbnJf
cGFnZXMpCiB7CkBAIC0zODAsNyArMzkwLDkgQEAgX19ibGtkZXZfZGlyZWN0X0lPKHN0cnVjdCBr
aW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICppdGVyLCBpbnQgbnJfcGFnZXMpCiAJCWJpby0+
YmlfaXRlci5iaV9zZWN0b3IgPSBwb3MgPj4gOTsKIAkJYmlvLT5iaV93cml0ZV9oaW50ID0gaW9j
Yi0+a2lfaGludDsKIAkJYmlvLT5iaV9wcml2YXRlID0gZGlvOwotCQliaW8tPmJpX2VuZF9pbyA9
IGJsa2Rldl9iaW9fZW5kX2lvOworCQliaW8tPmJpX2VuZF9pbyA9IGlvdl9pdGVyX2dldF9wYWdl
c191c2VfZ3VwKGl0ZXIpID8KKwkJCQkgYmxrZGV2X2Jpb19mcm9tX2d1cF9lbmRfaW8gOgorCQkJ
CSBibGtkZXZfYmlvX2VuZF9pbzsKIAkJYmlvLT5iaV9pb3ByaW8gPSBpb2NiLT5raV9pb3ByaW87
CiAKIAkJcmV0ID0gYmlvX2lvdl9pdGVyX2dldF9wYWdlcyhiaW8sIGl0ZXIpOwpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9iaW8uaCBiL2luY2x1ZGUvbGludXgvYmlvLmgKaW5kZXggZDY4YTQw
YzJjOWQ0Li5iOTQ2MGQxYTQ2NzkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvYmlvLmgKKysr
IGIvaW5jbHVkZS9saW51eC9iaW8uaApAQCAtNDUyLDYgKzQ1MiwxMyBAQCBzdGF0aWMgaW5saW5l
IGVudW0gYmlvX3JwX2ZsYWdzX3QgYmlvX3JwX2RpcnR5X2ZsYWcoYm9vbCBtYXJrX2RpcnR5KQog
CXJldHVybiBtYXJrX2RpcnR5ID8gQklPX1JQX01BUktfRElSVFkgOiBCSU9fUlBfTk9STUFMOwog
fQogCitzdGF0aWMgaW5saW5lIGVudW0gYmlvX3JwX2ZsYWdzX3QgYmlvX3JwX2d1cF9mbGFnKGJv
b2wgZnJvbV9ndXApCit7CisJcmV0dXJuIGZyb21fZ3VwID8gQklPX1JQX0ZST01fR1VQIDogQklP
X1JQX05PUk1BTDsKK30KKworZW51bSBiaW9fcnBfZmxhZ3NfdCBiaW9fcnBfZmxhZ3Moc3RydWN0
IGlvdl9pdGVyICppdGVyLCBib29sIG1hcmtfZGlydHkpOworCiB2b2lkIGJpb19yZWxlYXNlX3Bh
Z2VzKHN0cnVjdCBiaW8gKmJpbywgZW51bSBiaW9fcnBfZmxhZ3NfdCBmbGFncyk7CiBzdHJ1Y3Qg
cnFfbWFwX2RhdGE7CiBleHRlcm4gc3RydWN0IGJpbyAqYmlvX21hcF91c2VyX2lvdihzdHJ1Y3Qg
cmVxdWVzdF9xdWV1ZSAqLApAQCAtNDYzLDYgKzQ3MCw3IEBAIGV4dGVybiBzdHJ1Y3QgYmlvICpi
aW9fY29weV9rZXJuKHN0cnVjdCByZXF1ZXN0X3F1ZXVlICosIHZvaWQgKiwgdW5zaWduZWQgaW50
LAogCQkJCSBnZnBfdCwgaW50KTsKIGV4dGVybiB2b2lkIGJpb19zZXRfcGFnZXNfZGlydHkoc3Ry
dWN0IGJpbyAqYmlvKTsKIGV4dGVybiB2b2lkIGJpb19jaGVja19wYWdlc19kaXJ0eShzdHJ1Y3Qg
YmlvICpiaW8pOwordm9pZCBfX2Jpb19jaGVja19wYWdlc19kaXJ0eShzdHJ1Y3QgYmlvICpiaW8s
IGJvb2wgZnJvbV9ndXApOwogCiB2b2lkIGdlbmVyaWNfc3RhcnRfaW9fYWNjdChzdHJ1Y3QgcmVx
dWVzdF9xdWV1ZSAqcSwgaW50IG9wLAogCQkJCXVuc2lnbmVkIGxvbmcgc2VjdG9ycywgc3RydWN0
IGhkX3N0cnVjdCAqcGFydCk7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
