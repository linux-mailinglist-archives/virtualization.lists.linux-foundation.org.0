Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 410E1C0642
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 15:25:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3E292101F;
	Fri, 27 Sep 2019 13:25:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5883B101F
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 13:25:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C41508C7
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 13:25:01 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id i16so6604871wmd.3
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 06:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=hqb9k7CsU/G/nVYRGrmqBtdjrD4Otzmj8zLAjpaRg4I=;
	b=MIKKt3ECzcv4htc0rEcnds1akEDo7vZDI8/l0IQaeNFKvrflzzHIoPNdOwcB8d9iuI
	t+3e8qVpSqL4DkpVNiDJjL8TJghlfTJQJxhjqFlrVOkI6eVRPtEEYnwCl1/3f9qa/hjD
	FNPg0yDQUv+6l3+Osqs9CU6CpC3noXS2ebv02riq8b/Q5SnT0dTxggw1F6pouZWU2CnF
	D3LsMMtud5pfl1sFK2HPx49sb1lxel2N/lXSQBHiYxjDBj4v6scRlgeakuYUgp6+a/Eu
	PdQfVsN2o4rMhXWhsWDyn54vRMhe09k5nXVMgZDHXXPjvHvJh29XxnzGtEkIGM9CX/17
	Ew/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hqb9k7CsU/G/nVYRGrmqBtdjrD4Otzmj8zLAjpaRg4I=;
	b=UgE1F7B5dzT+CZNfS4EnfQDkZq4S6dAqcXjhudL48QzdiN9q1LnhwQttBckLMRRo+I
	PrtrJUQLQPvNB+8OgbMR1q7/upKMnag3Xmv6E5oGbS8sODcxQid9GEyWCckgQrxwWGdS
	Cqja6HO8bL7fPYUZvFU7oYQYr4/15oSyg60GF2XDE/gWRgjQ2Bn1AfIw+PNViuMKiKnh
	Kwzx0bq0DKbBVqQfPUP3n8jMtdaqU1ZnW8fawZdnzkJP5NqGFxOQypgqDbZHjWI2cSMe
	dci8IzfhoKxRuTbHBWyGkbr9Z7AS+XFFMKN1dK+Mn6qzMemGfDLiWHqdlukaIag8oFS1
	7SYA==
X-Gm-Message-State: APjAAAWCXGioqpK3IU5FpXurZu15uf1qTokyuMbKXoJP31YWhgvxGkG5
	rkoFiwK3oP0k1qKGLaCWs4ZDBpJ9
X-Google-Smtp-Source: APXvYqxEoZGnO1+n0+Vq/UvgJhTpTguJmPPHgyx5aP+8nWVrR0zZhBCNmCtrt+uo5iqP23Htuno/BA==
X-Received: by 2002:a05:600c:2:: with SMTP id g2mr7206199wmc.111.1569590700582;
	Fri, 27 Sep 2019 06:25:00 -0700 (PDT)
Received: from baker.fritz.box ([2a02:908:1252:fb60:2d04:d861:e9c6:56ab])
	by smtp.gmail.com with ESMTPSA id z3sm4917181wmi.30.2019.09.27.06.24.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Sep 2019 06:25:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>
To: airlied@redhat.com, kraxel@redhat.com, daniel@ffwll.ch,
	virtualization@lists.linux-foundation.org,
	spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/ttm: stop exporting ttm_mem_io_* functions
Date: Fri, 27 Sep 2019 15:24:58 +0200
Message-Id: <20190927132458.4359-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20190927132458.4359-1-christian.koenig@amd.com>
References: <20190927132458.4359-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

VGhvc2UgYXJlIG5vdCBzdXBwb3NlZCB0byBiZSB1c2VkIGJ5IGRyaXZlcnMuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191
dGlsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKaW5kZXggMDg2YmEyYzJm
NjBiLi4yZWNhNzUyYzM5ZTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3V0aWwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKQEAgLTEwMiw3
ICsxMDIsNiBAQCBpbnQgdHRtX21lbV9pb19sb2NrKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdl
ciAqbWFuLCBib29sIGludGVycnVwdGlibGUpCiAJbXV0ZXhfbG9jaygmbWFuLT5pb19yZXNlcnZl
X211dGV4KTsKIAlyZXR1cm4gMDsKIH0KLUVYUE9SVF9TWU1CT0wodHRtX21lbV9pb19sb2NrKTsK
IAogdm9pZCB0dG1fbWVtX2lvX3VubG9jayhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1h
bikKIHsKQEAgLTExMSw3ICsxMTAsNiBAQCB2b2lkIHR0bV9tZW1faW9fdW5sb2NrKHN0cnVjdCB0
dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuKQogCiAJbXV0ZXhfdW5sb2NrKCZtYW4tPmlvX3Jlc2Vy
dmVfbXV0ZXgpOwogfQotRVhQT1JUX1NZTUJPTCh0dG1fbWVtX2lvX3VubG9jayk7CiAKIHN0YXRp
YyBpbnQgdHRtX21lbV9pb19ldmljdChzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbikK
IHsKQEAgLTE1Myw3ICsxNTEsNiBAQCBpbnQgdHRtX21lbV9pb19yZXNlcnZlKHN0cnVjdCB0dG1f
Ym9fZGV2aWNlICpiZGV2LAogCX0KIAlyZXR1cm4gcmV0OwogfQotRVhQT1JUX1NZTUJPTCh0dG1f
bWVtX2lvX3Jlc2VydmUpOwogCiB2b2lkIHR0bV9tZW1faW9fZnJlZShzdHJ1Y3QgdHRtX2JvX2Rl
dmljZSAqYmRldiwKIAkJICAgICBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSkKQEAgLTE2OSw3ICsx
NjYsNiBAQCB2b2lkIHR0bV9tZW1faW9fZnJlZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwK
IAkJYmRldi0+ZHJpdmVyLT5pb19tZW1fZnJlZShiZGV2LCBtZW0pOwogCiB9Ci1FWFBPUlRfU1lN
Qk9MKHR0bV9tZW1faW9fZnJlZSk7CiAKIGludCB0dG1fbWVtX2lvX3Jlc2VydmVfdm0oc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICpibykKIHsKLS0gCjIuMTQuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
