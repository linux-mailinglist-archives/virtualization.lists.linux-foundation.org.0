Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F30337373C
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:03:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4349A13FC;
	Wed, 24 Jul 2019 18:59:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7988DCC4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 058BCFE
	for <virtualization@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 04:25:30 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id f25so20496923pgv.10
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 21:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sE4MQj+XhMD6UPTZi8xJ0bNX4cYnp7r/5/gkEQk0tas=;
	b=N74tfFByAZggYZcsUYTvgYBqmp8bGoZSPNbPePQDgI9xHOKtDI+JBR5Z/IiOFQ1dt4
	oWVFdgGyfImD0LwBldj16IkrMRl7/f0OT/Q4l6ls05QNNVgjJIUWu+aeK2CLI7WrmOO1
	TCwZxwbVGwL+85kP8X47MDnZlnY5CwsAaw+XO6UEjqntQs8fO4Oc87gAiS/1YP6rdwM3
	9NVpw94/A/DYK3lq7v7X4QjwLe8vgVS0TAdSk8ZgDg7r0yVNM7SKDo6TuP97iAlISt79
	gTDmZw4nL2v0p7bxSBy6D4Zi0oq/Mz2I8pSvkTef9m0MiEMvo0WtG93wFrP09qcMFi9e
	QIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sE4MQj+XhMD6UPTZi8xJ0bNX4cYnp7r/5/gkEQk0tas=;
	b=scWoiH1SFPKn2WtJJwg0/CNl9FwCKsJ7B9525bv/4TQh6XBHsXPWs0kv2IYRnfZ8Wc
	tPa/D9uAqJcJ8rXgxKLWdGle7Zo+fjTQt8e1mYBeEe9gP0/surf3QdzwkEMfuWqpYDd2
	zu9Iz7ydyJ7Cxi+AHzhtMTKpfQyx6m5UKOSrmeXat83wO0d0d/kjbW6kN0KSYpvo6S+f
	rZMq5Pa7XbEq67N4xJErQ8IH5so05avzqCDJ8mO2K4Uk6Iuz1bnjUnpjfrFW2ZWdc/Ji
	UndouYxZBNp0sWqKTjyhQo96BnVzdfCodlUNhLDbJrzPpgDJJKnRSxH9cMdyLdrh9dVI
	King==
X-Gm-Message-State: APjAAAXsiq/VhWzCj2UVxPqiQLgF/DS382pm5KJHOipXcQyk14Q+fimp
	KvQnXSGQ4jTcHb2Y/LVNgyo=
X-Google-Smtp-Source: APXvYqxW3prZwkWHWgnoMEubD7xNwrSIeIAF1uZdix4e6/fDDx4fF84KKWNkiOUj/KQ81cpzXumLMA==
X-Received: by 2002:a62:4d85:: with SMTP id a127mr9256862pfb.148.1563942329748;
	Tue, 23 Jul 2019 21:25:29 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
	by smtp.gmail.com with ESMTPSA id
	a15sm34153364pgw.3.2019.07.23.21.25.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 21:25:29 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 06/12] fs/nfs: convert put_page() to put_user_page*()
Date: Tue, 23 Jul 2019 21:25:12 -0700
Message-Id: <20190724042518.14363-7-jhubbard@nvidia.com>
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
b2R1Y2UgcHV0X3VzZXJfcGFnZSooKSwgcGxhY2Vob2xkZXIgdmVyc2lvbnMiKS4KClNpZ25lZC1v
ZmYtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+CkNjOiBsaW51eC1mc2RldmVsQHZn
ZXIua2VybmVsLm9yZwpDYzogbGludXgtYmxvY2tAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1t
bUBrdmFjay5vcmcKQ2M6IGxpbnV4LW5mc0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IEphbiBLYXJhIDxq
YWNrQHN1c2UuY3o+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4K
Q2M6IEFsZXhhbmRlciBWaXJvIDx2aXJvQHplbml2LmxpbnV4Lm9yZy51az4KQ2M6IEpvaGFubmVz
IFRodW1zaGlybiA8anRodW1zaGlybkBzdXNlLmRlPgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhj
aEBsc3QuZGU+CkNjOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+CkNjOiBNaW5nIExlaSA8
bWluZy5sZWlAcmVkaGF0LmNvbT4KQ2M6IERhdmUgQ2hpbm5lciA8ZGF2aWRAZnJvbW9yYml0LmNv
bT4KQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgpDYzogTWF0dGhldyBXaWxjb3gg
PHdpbGx5QGluZnJhZGVhZC5vcmc+CkNjOiBCb2F6IEhhcnJvc2ggPGJvYXpAcGxleGlzdG9yLmNv
bT4KQ2M6IFRyb25kIE15a2xlYnVzdCA8dHJvbmQubXlrbGVidXN0QGhhbW1lcnNwYWNlLmNvbT4K
Q2M6IEFubmEgU2NodW1ha2VyIDxhbm5hLnNjaHVtYWtlckBuZXRhcHAuY29tPgotLS0KIGZzL25m
cy9kaXJlY3QuYyB8IDEwICsrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvbmZzL2RpcmVjdC5jIGIvZnMvbmZz
L2RpcmVjdC5jCmluZGV4IDBjYjQ0MjQwNjE2OC4uMzVmMzBmZTI5MDBmIDEwMDY0NAotLS0gYS9m
cy9uZnMvZGlyZWN0LmMKKysrIGIvZnMvbmZzL2RpcmVjdC5jCkBAIC01MTIsNyArNTEyLDEwIEBA
IHN0YXRpYyBzc2l6ZV90IG5mc19kaXJlY3RfcmVhZF9zY2hlZHVsZV9pb3ZlYyhzdHJ1Y3QgbmZz
X2RpcmVjdF9yZXEgKmRyZXEsCiAJCQlwb3MgKz0gcmVxX2xlbjsKIAkJCWRyZXEtPmJ5dGVzX2xl
ZnQgLT0gcmVxX2xlbjsKIAkJfQotCQluZnNfZGlyZWN0X3JlbGVhc2VfcGFnZXMocGFnZXZlYywg
bnBhZ2VzKTsKKwkJaWYgKGlvdl9pdGVyX2dldF9wYWdlc191c2VfZ3VwKGl0ZXIpKQorCQkJcHV0
X3VzZXJfcGFnZXMocGFnZXZlYywgbnBhZ2VzKTsKKwkJZWxzZQorCQkJbmZzX2RpcmVjdF9yZWxl
YXNlX3BhZ2VzKHBhZ2V2ZWMsIG5wYWdlcyk7CiAJCWt2ZnJlZShwYWdldmVjKTsKIAkJaWYgKHJl
c3VsdCA8IDApCiAJCQlicmVhazsKQEAgLTkzNSw3ICs5MzgsMTAgQEAgc3RhdGljIHNzaXplX3Qg
bmZzX2RpcmVjdF93cml0ZV9zY2hlZHVsZV9pb3ZlYyhzdHJ1Y3QgbmZzX2RpcmVjdF9yZXEgKmRy
ZXEsCiAJCQlwb3MgKz0gcmVxX2xlbjsKIAkJCWRyZXEtPmJ5dGVzX2xlZnQgLT0gcmVxX2xlbjsK
IAkJfQotCQluZnNfZGlyZWN0X3JlbGVhc2VfcGFnZXMocGFnZXZlYywgbnBhZ2VzKTsKKwkJaWYg
KGlvdl9pdGVyX2dldF9wYWdlc191c2VfZ3VwKGl0ZXIpKQorCQkJcHV0X3VzZXJfcGFnZXMocGFn
ZXZlYywgbnBhZ2VzKTsKKwkJZWxzZQorCQkJbmZzX2RpcmVjdF9yZWxlYXNlX3BhZ2VzKHBhZ2V2
ZWMsIG5wYWdlcyk7CiAJCWt2ZnJlZShwYWdldmVjKTsKIAkJaWYgKHJlc3VsdCA8IDApCiAJCQli
cmVhazsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
