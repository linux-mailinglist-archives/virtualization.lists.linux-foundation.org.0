Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB5F73739
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:03:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A56D6141F;
	Wed, 24 Jul 2019 18:59:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7B860CC4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4F303F1
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:27 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 19so20231161pfa.4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 21:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VoKYI+UUiS6YcrnvVkznU7iujzeTV7cPJsbn4q5uYok=;
	b=srCEjuKdmgTtGGJA378IGBXmCqyTbsbIjMqfoeenayBrGBy5vehEwtDrFvuijZFoTd
	rScSFUBXDFgZSITel7jOkrOPuVU8F5rry3vtfpMM2D7CeG0RrJuH7hgFj+PRndl7N1gW
	deZirUtKYKLuIRRXAf1U+l262rmyF1+wQhnXfVmQ91LL1+9RzmuQ9g6DIyRbodwSmwkf
	luAgCx4Jh2U/kIoDrgk0a2bpkEIwsDMjxtnPpArcF/E8dH/PwetBRncfIHEHnvxafXic
	wOzPw8hX8ys1ZDuhUpTDpwmfZFOimd4ZZ9s54WJn7/lu6Or6c+DjhaXkLZqlThRstapF
	vwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VoKYI+UUiS6YcrnvVkznU7iujzeTV7cPJsbn4q5uYok=;
	b=RIudOdV0LV5U9oPrvaHR1mvG3p+suBvewxKe5GCzso9eFCe0zRbWyTZGn+C1pvVU/q
	DVfCgJBO7bTy2zox6ftOo6mUeP/TbUEbVm1Uyh1awZKBaYgs4U/zDroqZUj6fBDrU7X3
	avUwePLDwiSgOY8QbQseHKrlH33xMtFrf/c0MeBN7RLehbOfBXD8P+s1qUdV1Fdn1naC
	JJdrEwRaU24A6+/69/DLSgoq1dN7yk0549Lirzw1Pkk9v1s2GhG4PkCHy/MDRRNcYRf8
	7xZYagJVeFpJQHjsp+p1tx5xnV/ra/OoU/phMx/c9/NZBIsf0ct/JIQjVfJlrm51N6tI
	LpGg==
X-Gm-Message-State: APjAAAX1K+/9PBxV0GGMzicQNnChrB8IwpcsshaDbe09Qq7wAeYUklpe
	tnWMHR6K2ALoRBIyIw/mkmc=
X-Google-Smtp-Source: APXvYqyK6xSNDGD+vqS3B3uhhp2vi85DZLeiUnQNXlrooXu4OGV2TbsZCsKTXuxuk/1vZZ0xEw9zNg==
X-Received: by 2002:aa7:9834:: with SMTP id q20mr9351362pfl.196.1563942326983; 
	Tue, 23 Jul 2019 21:25:26 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
	by smtp.gmail.com with ESMTPSA id
	a15sm34153364pgw.3.2019.07.23.21.25.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 21:25:26 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 04/12] block: bio_release_pages: convert put_page() to
	put_user_page*()
Date: Tue, 23 Jul 2019 21:25:10 -0700
Message-Id: <20190724042518.14363-5-jhubbard@nvidia.com>
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
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Minwoo Im <minwoo.im.dev@gmail.com>, v9fs-developer@lists.sourceforge.net,
	Eric Van Hensbergen <ericvh@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
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
ZnJvbSBKw6lyw7RtZSdzIG9yaWdpbmFsIHBhdGNoOgogICAgKiByZXdvcmtlZCB0byBiZSBjb21w
YXRpYmxlIHdpdGggcmVjZW50IGJpb19yZWxlYXNlX3BhZ2VzKCkgY2hhbmdlcywKICAgICogcmVm
YWN0b3JlZCBzbGlnaHRseSB0byByZW1vdmUgc29tZSBjb2RlIGR1cGxpY2F0aW9uLAogICAgKiB1
c2UgYW4gYXBwcm9hY2ggdGhhdCBjaGFuZ2VzIGZld2VyIGJpb19jaGVja19wYWdlc19kaXJ0eSgp
CiAgICAgIGNhbGxlcnMuCgpTaWduZWQtb2ZmLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VA
cmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEu
Y29tPgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPgpDYzogTWlud29v
IEltIDxtaW53b28uaW0uZGV2QGdtYWlsLmNvbT4KQ2M6IEplbnMgQXhib2UgPGF4Ym9lQGtlcm5l
bC5kaz4KLS0tCiBibG9jay9iaW8uYyAgICAgICAgIHwgNjAgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tCiBpbmNsdWRlL2xpbnV4L2Jpby5oIHwgIDEgKwogMiBm
aWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9ibG9jay9iaW8uYyBiL2Jsb2NrL2Jpby5jCmluZGV4IDc2NzVlMmRlNTA5ZC4uNzRmOWVi
YTI1ODNiIDEwMDY0NAotLS0gYS9ibG9jay9iaW8uYworKysgYi9ibG9jay9iaW8uYwpAQCAtODQ0
LDcgKzg0NCwxMSBAQCB2b2lkIGJpb19yZWxlYXNlX3BhZ2VzKHN0cnVjdCBiaW8gKmJpbywgZW51
bSBiaW9fcnBfZmxhZ3NfdCBmbGFncykKIAliaW9fZm9yX2VhY2hfc2VnbWVudF9hbGwoYnZlYywg
YmlvLCBpdGVyX2FsbCkgewogCQlpZiAoKGZsYWdzICYgQklPX1JQX01BUktfRElSVFkpICYmICFQ
YWdlQ29tcG91bmQoYnZlYy0+YnZfcGFnZSkpCiAJCQlzZXRfcGFnZV9kaXJ0eV9sb2NrKGJ2ZWMt
PmJ2X3BhZ2UpOwotCQlwdXRfcGFnZShidmVjLT5idl9wYWdlKTsKKworCQlpZiAoZmxhZ3MgJiBC
SU9fUlBfRlJPTV9HVVApCisJCQlwdXRfdXNlcl9wYWdlKGJ2ZWMtPmJ2X3BhZ2UpOworCQllbHNl
CisJCQlwdXRfcGFnZShidmVjLT5idl9wYWdlKTsKIAl9CiB9CiAKQEAgLTE2NjcsMjggKzE2NzEs
NTAgQEAgc3RhdGljIHZvaWQgYmlvX2RpcnR5X2ZuKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayk7
CiBzdGF0aWMgREVDTEFSRV9XT1JLKGJpb19kaXJ0eV93b3JrLCBiaW9fZGlydHlfZm4pOwogc3Rh
dGljIERFRklORV9TUElOTE9DSyhiaW9fZGlydHlfbG9jayk7CiBzdGF0aWMgc3RydWN0IGJpbyAq
YmlvX2RpcnR5X2xpc3Q7CitzdGF0aWMgc3RydWN0IGJpbyAqYmlvX2d1cF9kaXJ0eV9saXN0Owog
Ci0vKgotICogVGhpcyBydW5zIGluIHByb2Nlc3MgY29udGV4dAotICovCi1zdGF0aWMgdm9pZCBi
aW9fZGlydHlfZm4oc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQorc3RhdGljIHZvaWQgX19iaW9f
ZGlydHlfZm4oc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrLAorCQkJICAgc3RydWN0IGJpbyAqKmRp
cnR5X2xpc3QsCisJCQkgICBlbnVtIGJpb19ycF9mbGFnc190IGZsYWdzKQogewogCXN0cnVjdCBi
aW8gKmJpbywgKm5leHQ7CiAKIAlzcGluX2xvY2tfaXJxKCZiaW9fZGlydHlfbG9jayk7Ci0JbmV4
dCA9IGJpb19kaXJ0eV9saXN0OwotCWJpb19kaXJ0eV9saXN0ID0gTlVMTDsKKwluZXh0ID0gKmRp
cnR5X2xpc3Q7CisJKmRpcnR5X2xpc3QgPSBOVUxMOwogCXNwaW5fdW5sb2NrX2lycSgmYmlvX2Rp
cnR5X2xvY2spOwogCiAJd2hpbGUgKChiaW8gPSBuZXh0KSAhPSBOVUxMKSB7CiAJCW5leHQgPSBi
aW8tPmJpX3ByaXZhdGU7CiAKLQkJYmlvX3JlbGVhc2VfcGFnZXMoYmlvLCBCSU9fUlBfTUFSS19E
SVJUWSk7CisJCWJpb19yZWxlYXNlX3BhZ2VzKGJpbywgQklPX1JQX01BUktfRElSVFkgfCBmbGFn
cyk7CiAJCWJpb19wdXQoYmlvKTsKIAl9CiB9CiAKLXZvaWQgYmlvX2NoZWNrX3BhZ2VzX2RpcnR5
KHN0cnVjdCBiaW8gKmJpbykKKy8qCisgKiBUaGlzIHJ1bnMgaW4gcHJvY2VzcyBjb250ZXh0Cisg
Ki8KK3N0YXRpYyB2b2lkIGJpb19kaXJ0eV9mbihzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCit7
CisJX19iaW9fZGlydHlfZm4od29yaywgJmJpb19kaXJ0eV9saXN0LCAgICAgQklPX1JQX05PUk1B
TCk7CisJX19iaW9fZGlydHlfZm4od29yaywgJmJpb19ndXBfZGlydHlfbGlzdCwgQklPX1JQX0ZS
T01fR1VQKTsKK30KKworLyoqCisgKiBfX2Jpb19jaGVja19wYWdlc19kaXJ0eSgpIC0gcXVldWUg
dXAgcGFnZXMgb24gYSB3b3JrcXVldWUgdG8gZGlydHkgdGhlbQorICogQGJpbzogdGhlIGJpbyBz
dHJ1Y3QgY29udGFpbmluZyB0aGUgcGFnZXMgd2Ugc2hvdWxkIGRpcnR5CisgKiBAZnJvbV9ndXA6
IGRpZCB0aGUgcGFnZXMgaW4gdGhlIGJpbyBjYW1lIGZyb20gR1VQIChnZXRfdXNlcl9wYWdlcyoo
KSkKKyAqCisgKiBUaGlzIHdpbGwgZ28gb3ZlciBhbGwgcGFnZXMgaW4gdGhlIGJpbywgYW5kIGZv
ciBlYWNoIG5vbiBkaXJ0eSBwYWdlLCB0aGUKKyAqIGJpbyBpcyBhZGRlZCB0byBhIGxpc3Qgb2Yg
YmlvJ3MgdGhhdCBuZWVkIHRvIGdldCB0aGVpciBwYWdlcyBkaXJ0aWVkLgorICoKKyAqIFdlIGFs
c28gbmVlZCB0byBrbm93IGlmIHRoZSBwYWdlcyBpbiB0aGUgYmlvIGFyZSBjb21pbmcgZnJvbSBH
VVAgb3Igbm90LAorICogYXMgR1VQZWQgcGFnZXMgbmVlZCB0byBiZSByZWxlYXNlZCB2aWEgcHV0
X3VzZXJfcGFnZSgpLCBpbnN0ZWFkIG9mCisgKiBwdXRfcGFnZSgpLiBQbGVhc2Ugc2VlIERvY3Vt
ZW50YXRpb24vdm0vZ2V0X3VzZXJfcGFnZXMucnN0IGZvciBkZXRhaWxzCisgKiBvbiB0aGF0Lgor
ICovCit2b2lkIF9fYmlvX2NoZWNrX3BhZ2VzX2RpcnR5KHN0cnVjdCBiaW8gKmJpbywgYm9vbCBm
cm9tX2d1cCkKIHsKIAlzdHJ1Y3QgYmlvX3ZlYyAqYnZlYzsKIAl1bnNpZ25lZCBsb25nIGZsYWdz
OwpAQCAtMTY5OSwxNyArMTcyNSwyNyBAQCB2b2lkIGJpb19jaGVja19wYWdlc19kaXJ0eShzdHJ1
Y3QgYmlvICpiaW8pCiAJCQlnb3RvIGRlZmVyOwogCX0KIAotCWJpb19yZWxlYXNlX3BhZ2VzKGJp
bywgQklPX1JQX05PUk1BTCk7CisJYmlvX3JlbGVhc2VfcGFnZXMoYmlvLCBmcm9tX2d1cCA/IEJJ
T19SUF9GUk9NX0dVUCA6IEJJT19SUF9OT1JNQUwpOwogCWJpb19wdXQoYmlvKTsKIAlyZXR1cm47
CiBkZWZlcjoKIAlzcGluX2xvY2tfaXJxc2F2ZSgmYmlvX2RpcnR5X2xvY2ssIGZsYWdzKTsKLQli
aW8tPmJpX3ByaXZhdGUgPSBiaW9fZGlydHlfbGlzdDsKLQliaW9fZGlydHlfbGlzdCA9IGJpbzsK
KwlpZiAoZnJvbV9ndXApIHsKKwkJYmlvLT5iaV9wcml2YXRlID0gYmlvX2d1cF9kaXJ0eV9saXN0
OworCQliaW9fZ3VwX2RpcnR5X2xpc3QgPSBiaW87CisJfSBlbHNlIHsKKwkJYmlvLT5iaV9wcml2
YXRlID0gYmlvX2RpcnR5X2xpc3Q7CisJCWJpb19kaXJ0eV9saXN0ID0gYmlvOworCX0KIAlzcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZiaW9fZGlydHlfbG9jaywgZmxhZ3MpOwogCXNjaGVkdWxlX3dv
cmsoJmJpb19kaXJ0eV93b3JrKTsKIH0KIAordm9pZCBiaW9fY2hlY2tfcGFnZXNfZGlydHkoc3Ry
dWN0IGJpbyAqYmlvKQoreworCV9fYmlvX2NoZWNrX3BhZ2VzX2RpcnR5KGJpbywgZmFsc2UpOwor
fQorCiB2b2lkIHVwZGF0ZV9pb190aWNrcyhzdHJ1Y3QgaGRfc3RydWN0ICpwYXJ0LCB1bnNpZ25l
ZCBsb25nIG5vdykKIHsKIAl1bnNpZ25lZCBsb25nIHN0YW1wOwpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9iaW8uaCBiL2luY2x1ZGUvbGludXgvYmlvLmgKaW5kZXggMjcxNWU1NTY3OWMxLi5k
NjhhNDBjMmM5ZDQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvYmlvLmgKKysrIGIvaW5jbHVk
ZS9saW51eC9iaW8uaApAQCAtNDQ0LDYgKzQ0NCw3IEBAIGludCBiaW9faW92X2l0ZXJfZ2V0X3Bh
Z2VzKHN0cnVjdCBiaW8gKmJpbywgc3RydWN0IGlvdl9pdGVyICppdGVyKTsKIGVudW0gYmlvX3Jw
X2ZsYWdzX3QgewogCUJJT19SUF9OT1JNQUwJCT0gMCwKIAlCSU9fUlBfTUFSS19ESVJUWQk9IDEs
CisJQklPX1JQX0ZST01fR1VQCQk9IDIsCiB9OwogCiBzdGF0aWMgaW5saW5lIGVudW0gYmlvX3Jw
X2ZsYWdzX3QgYmlvX3JwX2RpcnR5X2ZsYWcoYm9vbCBtYXJrX2RpcnR5KQotLSAKMi4yMi4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
