Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D044B73731
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:02:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9647514B6;
	Wed, 24 Jul 2019 18:59:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AEDB3CC4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A3262F1
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:21 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id s1so14200905pgr.2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 21:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=czbKIXOb/Go0XhMRs2MEN6VnTG6u3MuZundQHh6fuSE=;
	b=drt6EjFdosCAcMEHtdm6+Wwi0M6mSxOzFkxqawZr6IPXLSVzqb/W29XJdPWwpIC0hK
	6O36OujVLFyXEay6jApmdcKGKaFf8ZHrynwkSnL37TGZQHVi5dSIejM/BVPUxQ7VV65S
	fWBfNJcl5fT06CyStqADu0QhfKQgev+DV1jB/43XtDAQrRVBT4D8hAHyS32+/jE194Ee
	9IJK8BdynnPV24hoHobSOouQX3yA4+C8Ogba9Jjmu1EUBDg3exofJAkPMZ4BVkwyR1FN
	DpKTuGd8V6acalOBWqjEaikoQcAKX4Ix3w6DkaRL7W59P9w2XZ6f+kz4iv47D5f4dYHi
	ARbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=czbKIXOb/Go0XhMRs2MEN6VnTG6u3MuZundQHh6fuSE=;
	b=W/fECxpvrAhqBozFt5aB2WwddPXyBj0PkQgUQZIeAugPojeVBCncx1s8+FOXDT2vdp
	Qv6Ea+8UCLtH50KFtkWppgG+nGlt0xEkwO00cErMmex6KvU6Olpr/hhudPUhgg3qhwk1
	GWPIbDtU6PLHWDKhj0ePMkLdKwtnTHqEwQdaw8nnF2ZEJDjc53md3mdWwbO87FyA+eE2
	bs5CkLLFwzrNZA3vCEDIiCXDl9BuQ9KNhs93G6fD8B2JgmaQuqFgDKeKXyLN8rcJxzPg
	C2SfN3xrMVCJEKrqQVnkv0ZJd+mOMIvowne01a4fd5SXEqxlEo3SXnxiqoFHrI2M9gci
	Rofg==
X-Gm-Message-State: APjAAAUXpUMy3Ll3v+ECrXBytC8BIpZQrijfwD0HAFxKtPpO2IpuZQPZ
	CaQCjcKuBXYDjLu5Prs1zC8=
X-Google-Smtp-Source: APXvYqwbbPiJvrG7YMdt1a1WYUqGY2Z5kAsIWFPe6nz2zmmLERZ6mi3tyMsrNzYm3HTPDg7yUokVfw==
X-Received: by 2002:a65:6288:: with SMTP id f8mr74189986pgv.292.1563942321242; 
	Tue, 23 Jul 2019 21:25:21 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
	by smtp.gmail.com with ESMTPSA id
	a15sm34153364pgw.3.2019.07.23.21.25.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 21:25:20 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 00/12] block/bio, fs: convert put_page() to put_user_page*()
Date: Tue, 23 Jul 2019 21:25:06 -0700
Message-Id: <20190724042518.14363-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKSGksCgpUaGlzIGlzIG1v
c3RseSBKZXJvbWUncyB3b3JrLCBjb252ZXJ0aW5nIHRoZSBibG9jay9iaW8gYW5kIHJlbGF0ZWQg
YXJlYXMKdG8gY2FsbCBwdXRfdXNlcl9wYWdlKigpIGluc3RlYWQgb2YgcHV0X3BhZ2UoKS4gQmVj
YXVzZSBJJ3ZlIGNoYW5nZWQKSmVyb21lJ3MgcGF0Y2hlcywgaW4gc29tZSBjYXNlcyBzaWduaWZp
Y2FudGx5LCBJJ2QgbGlrZSB0byBnZXQgaGlzCmZlZWRiYWNrIGJlZm9yZSB3ZSBhY3R1YWxseSBs
ZWF2ZSBoaW0gbGlzdGVkIGFzIHRoZSBhdXRob3IgKGhlIG1pZ2h0CndhbnQgdG8gZGlzb3duIHNv
bWUgb3IgYWxsIG9mIHRoZXNlKS4KCkkgYWRkZWQgYSBuZXcgcGF0Y2gsIGluIG9yZGVyIHRvIG1h
a2UgdGhpcyB3b3JrIHdpdGggQ2hyaXN0b3BoIEhlbGx3aWcncwpyZWNlbnQgb3ZlcmhhdWwgdG8g
YmlvX3JlbGVhc2VfcGFnZXMoKTogImJsb2NrOiBiaW9fcmVsZWFzZV9wYWdlczogdXNlCmZsYWdz
IGFyZyBpbnN0ZWFkIG9mIGJvb2wiLgoKSSd2ZSBzdGFydGVkIHRoZSBzZXJpZXMgd2l0aCBhIHBh
dGNoIHRoYXQgSSd2ZSBwb3N0ZWQgaW4gYW5vdGhlcgpzZXJpZXMgKCJtbS9ndXA6IGFkZCBtYWtl
X2RpcnR5IGFyZyB0byBwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCkiWzFdKSwKYmVjYXVzZSBJ
J20gbm90IHN1cmUgd2hpY2ggb2YgdGhlc2Ugd2lsbCBnbyBpbiBmaXJzdCwgYW5kIHRoaXMgYWxs
b3dzIGVhY2gKdG8gc3RhbmQgYWxvbmUuCgpUZXN0aW5nOiBub3QgbXVjaCBiZXlvbmQgYnVpbGQg
YW5kIGJvb3QgdGVzdGluZyBoYXMgYmVlbiBkb25lIHlldC4gQW5kCkknbSBub3Qgc2V0IHVwIHRv
IGV2ZW4gZXhlcmNpc2UgYWxsIG9mIGl0IChlc3BlY2lhbGx5IHRoZSBJQiBwYXJ0cykgYXQKcnVu
IHRpbWUuCgpBbnl3YXksIGNoYW5nZXMgaGVyZSBhcmU6CgoqIFN0b3JlLCBpbiB0aGUgaW92X2l0
ZXIsIGEgImNhbWUgZnJvbSBndXAgKGdldF91c2VyX3BhZ2VzKSIgcGFyYW1ldGVyLgogIFRoZW4s
IHVzZSB0aGUgbmV3IGlvdl9pdGVyX2dldF9wYWdlc191c2VfZ3VwKCkgdG8gcmV0cmlldmUgaXQg
d2hlbgogIGl0IGlzIHRpbWUgdG8gcmVsZWFzZSB0aGUgcGFnZXMuIFRoYXQgYWxsb3dzIGNob29z
aW5nIGJldHdlZW4gcHV0X3BhZ2UoKQogIGFuZCBwdXRfdXNlcl9wYWdlKigpLgoKKiBQYXNzIGlu
IG9uZSBtb3JlIHBpZWNlIG9mIGluZm9ybWF0aW9uIHRvIGJpb19yZWxlYXNlX3BhZ2VzOiBhICJm
cm9tX2d1cCIKICBwYXJhbWV0ZXIuIFNpbWlsYXIgdXNlIGFzIGFib3ZlLgoKKiBDaGFuZ2UgdGhl
IGJsb2NrIGxheWVyLCBhbmQgc2V2ZXJhbCBmaWxlIHN5c3RlbXMsIHRvIHVzZQogIHB1dF91c2Vy
X3BhZ2UqKCkuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDE5MDcyNDAxMjYwNi4y
NTg0NC0yLWpodWJiYXJkQG52aWRpYS5jb20KICAgIEFuZCBwbGVhc2Ugbm90ZSB0aGUgY29ycmVj
dGlvbiBlbWFpbCB0aGF0IEkgcG9zdGVkIGFzIGEgZm9sbG93LXVwLAogICAgaWYgeW91J3JlIGxv
b2tpbmcgY2xvc2VseSBhdCB0aGF0IHBhdGNoLiA6KSBUaGUgZml4ZWQgdmVyc2lvbiBpcwogICAg
aW5jbHVkZWQgaGVyZS4KCkpvaG4gSHViYmFyZCAoMyk6CiAgbW0vZ3VwOiBhZGQgbWFrZV9kaXJ0
eSBhcmcgdG8gcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jaygpCiAgYmxvY2s6IGJpb19yZWxlYXNl
X3BhZ2VzOiB1c2UgZmxhZ3MgYXJnIGluc3RlYWQgb2YgYm9vbAogIGZzL2NlcGg6IGZpeCBhIGJ1
aWxkIHdhcm5pbmc6IHJldHVybmluZyBhIHZhbHVlIGZyb20gdm9pZCBmdW5jdGlvbgoKSsOpcsO0
bWUgR2xpc3NlICg5KToKICBpb3ZfaXRlcjogYWRkIGhlbHBlciB0byB0ZXN0IGlmIGFuIGl0ZXIg
d291bGQgdXNlIEdVUCB2MgogIGJsb2NrOiBiaW9fcmVsZWFzZV9wYWdlczogY29udmVydCBwdXRf
cGFnZSgpIHRvIHB1dF91c2VyX3BhZ2UqKCkKICBibG9ja19kZXY6IGNvbnZlcnQgcHV0X3BhZ2Uo
KSB0byBwdXRfdXNlcl9wYWdlKigpCiAgZnMvbmZzOiBjb252ZXJ0IHB1dF9wYWdlKCkgdG8gcHV0
X3VzZXJfcGFnZSooKQogIHZob3N0LXNjc2k6IGNvbnZlcnQgcHV0X3BhZ2UoKSB0byBwdXRfdXNl
cl9wYWdlKigpCiAgZnMvY2lmczogY29udmVydCBwdXRfcGFnZSgpIHRvIHB1dF91c2VyX3BhZ2Uq
KCkKICBmcy9mdXNlOiBjb252ZXJ0IHB1dF9wYWdlKCkgdG8gcHV0X3VzZXJfcGFnZSooKQogIGZz
L2NlcGg6IGNvbnZlcnQgcHV0X3BhZ2UoKSB0byBwdXRfdXNlcl9wYWdlKigpCiAgOXAvbmV0OiBj
b252ZXJ0IHB1dF9wYWdlKCkgdG8gcHV0X3VzZXJfcGFnZSooKQoKIGJsb2NrL2Jpby5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA4MSArKysrKysrKysrKystLS0KIGRyaXZlcnMv
aW5maW5pYmFuZC9jb3JlL3VtZW0uYyAgICAgICAgICAgICB8ICAgNSArLQogZHJpdmVycy9pbmZp
bmliYW5kL2h3L2hmaTEvdXNlcl9wYWdlcy5jICAgIHwgICA1ICstCiBkcml2ZXJzL2luZmluaWJh
bmQvaHcvcWliL3FpYl91c2VyX3BhZ2VzLmMgfCAgIDUgKy0KIGRyaXZlcnMvaW5maW5pYmFuZC9o
dy91c25pYy91c25pY191aW9tLmMgICB8ICAgNSArLQogZHJpdmVycy9pbmZpbmliYW5kL3N3L3Np
dy9zaXdfbWVtLmMgICAgICAgIHwgICA4ICstCiBkcml2ZXJzL3Zob3N0L3Njc2kuYyAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMTMgKystCiBmcy9ibG9ja19kZXYuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMjIgKysrLQogZnMvY2VwaC9kZWJ1Z2ZzLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAyICstCiBmcy9jZXBoL2ZpbGUuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNjIgKysrKysrKystLS0KIGZzL2NpZnMvY2lmc2dsb2IuaCAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMyArCiBmcy9jaWZzL2ZpbGUuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMjIgKysrLQogZnMvY2lmcy9taXNjLmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDE5ICsrKy0KIGZzL2RpcmVjdC1pby5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMiArLQogZnMvZnVzZS9kZXYuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDIyICsrKy0KIGZzL2Z1c2UvZmlsZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1
MyArKysrKysrLS0tCiBmcy9uZnMvZGlyZWN0LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMTAgKy0KIGluY2x1ZGUvbGludXgvYmlvLmggICAgICAgICAgICAgICAgICAgICAgICB8ICAy
MiArKystCiBpbmNsdWRlL2xpbnV4L21tLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDUg
Ky0KIGluY2x1ZGUvbGludXgvdWlvLmggICAgICAgICAgICAgICAgICAgICAgICB8ICAxMSArKwog
bW0vZ3VwLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTE1ICsrKysrKysr
Ky0tLS0tLS0tLS0tLQogbmV0LzlwL3RyYW5zX2NvbW1vbi5jICAgICAgICAgICAgICAgICAgICAg
IHwgIDE0ICsrLQogbmV0LzlwL3RyYW5zX2NvbW1vbi5oICAgICAgICAgICAgICAgICAgICAgIHwg
ICAzICstCiBuZXQvOXAvdHJhbnNfdmlydGlvLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMTgg
KysrLQogMjQgZmlsZXMgY2hhbmdlZCwgMzU3IGluc2VydGlvbnMoKyksIDE3MCBkZWxldGlvbnMo
LSkKCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
