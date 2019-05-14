Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F17FC1D10F
	for <lists.virtualization@lfdr.de>; Tue, 14 May 2019 23:12:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 35AF1D9C;
	Tue, 14 May 2019 21:12:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B05BBC3E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 21:11:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3020284F
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 21:11:59 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c15so197131qkl.2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 14:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:content-transfer-encoding;
	bh=qULCzBdQcxHh1C2O8j06vBUB9AzYlN4esxwCWasX1SQ=;
	b=ZZhOFZHKcC4CBjaIbQvvDJuuDOiWrUIfcmp4jeloFfkHbT1rWf7BASOJxnUX0RDuee
	iCMRmz6D3IyS6quP0nAArytxJtT0FOoemvyopsHxoSKtKOlNXewnRsRAyv8MHcPOwPwi
	iRkPd0V4Mf/2bkfCG48yXPUXddESRZz8IR24m/bFYkayDK/T05if9u4sJKdscD40/8/P
	9vQsMPwsTfrmavw/ptUnNuPejlL3VP9Amzh6B8rX0R4o243ELBVOrOfcImsUsdxVA3Hj
	wEM9Zc5UlzLM0BlvHTirH2IgkeuI+awUlfM+dMpyMuly7/KhqZP9flhVYUPFi1oZ8oIN
	gt7Q==
X-Gm-Message-State: APjAAAV7jc30H5KYSq5MC3/+0Uhwt1TlwBx3lhX2X2EoOcyEY0YUkgOL
	d4+sKhyL5cOOKjQVPRQ2LeBy9w==
X-Google-Smtp-Source: APXvYqxmZ0SoPCfFH0lsC6mFWej9UEaIAHl3b5sj9Rk3s8zGc9PLlPE58FGHNqVgQ1TOJiOuRs78Bw==
X-Received: by 2002:a37:4f8a:: with SMTP id
	d132mr16914864qkb.272.1557868318291; 
	Tue, 14 May 2019 14:11:58 -0700 (PDT)
Received: from redhat.com ([185.54.206.10]) by smtp.gmail.com with ESMTPSA id
	f16sm8168845qkk.19.2019.05.14.14.11.49
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 14 May 2019 14:11:57 -0700 (PDT)
Date: Tue, 14 May 2019 17:11:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] vhost: cleanups and fixes
Message-ID: <20190514171147-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: andrea.parri@amarulasolutions.com, kvm@vger.kernel.org, mst@redhat.com,
	netdev@vger.kernel.org, yuehaibing@huawei.com,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
	j.neuschaefer@gmx.net, pbonzini@redhat.com, benbjiang@tencent.com
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBlOTNjOWM5OWE2MjljNjE4MzdkNWE3
ZmMyMTIwY2QyYjZjNzBkYmRkOgoKICBMaW51eCA1LjEgKDIwMTktMDUtMDUgMTc6NDI6NTggLTA3
MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L21zdC92aG9zdC5naXQgdGFncy9m
b3JfbGludXMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAwNTBmNGM0ZDJmYmJkODIx
N2Q5NGRjMjEwNTFjYzU5N2QyYTY4NDhiOgoKICB2aXJ0aW8vczM5MDogZW5hYmxlIHBhY2tlZCBy
aW5nICgyMDE5LTA1LTEyIDEzOjExOjM2IC0wNDAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQp2aXJ0aW86IGZpeGVzLCBm
ZWF0dXJlcwoKczM5MCBoYXMgcGFja2VkIHJpbmcgc3VwcG9ydC4Kc2V2ZXJhbCBmaXhlcy4KClNp
Z25lZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+CgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CkhhbGlsIFBhc2ljICgzKToKICAgICAgdmlydGlvL3MzOTA6IHVzZSB2cmluZ19jcmVhdGVfdmly
dHF1ZXVlCiAgICAgIHZpcnRpby9zMzkwOiBETUEgc3VwcG9ydCBmb3IgdmlydGlvLWNjdwogICAg
ICB2aXJ0aW8vczM5MDogZW5hYmxlIHBhY2tlZCByaW5nCgpKaWFuZyBCaWFvICgxKToKICAgICAg
dmlydGlvL3ZpcnRpb19yaW5nOiBkbyBzb21lIGNvbW1lbnQgZml4ZXMKCkpvbmF0aGFuIE5ldXNj
aMOkZmVyICgxKToKICAgICAgdG9vbHMvdmlydGlvL3Jpbmd0ZXN0OiBSZW1vdmUgYm9ndXMgZGVm
aW5pdGlvbiBvZiBCVUdfT04oKQoKUGFvbG8gQm9uemluaSAoMSk6CiAgICAgIHZob3N0LXNjc2k6
IHJlbW92ZSBpbmNvcnJlY3QgbWVtb3J5IGJhcnJpZXIKCll1ZUhhaWJpbmcgKDEpOgogICAgICB2
aXJ0aW9fcmluZzogRml4IHBvdGVudGlhbCBtZW0gbGVhayBpbiB2aXJ0cXVldWVfYWRkX2luZGly
ZWN0X3BhY2tlZAoKIGRyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jIHwgNTIgKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy92aG9zdC9zY3NpLmMg
ICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jICAgICB8IDI4
ICsrKysrKysrKysrKy0tLS0tLS0tLS0KIGluY2x1ZGUvbGludXgvdmlydGlvLmggICAgICAgICAg
IHwgMTcgLS0tLS0tLS0tLS0tLQogdG9vbHMvdmlydGlvL3Jpbmd0ZXN0L3B0cl9yaW5nLmMgfCAg
MSAtCiA1IGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDU5IGRlbGV0aW9ucygtKQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
