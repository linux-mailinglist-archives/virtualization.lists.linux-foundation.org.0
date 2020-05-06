Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0361C6522
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 02:36:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 67ABB879F8;
	Wed,  6 May 2020 00:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jlmLv29fTgT5; Wed,  6 May 2020 00:36:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 65666878D0;
	Wed,  6 May 2020 00:36:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54435C0859;
	Wed,  6 May 2020 00:36:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D26D6C0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 00:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C15168697C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 00:36:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9xC7jBGlGh93
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 00:36:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 74E718693D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 00:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588725364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r91Vkwfhs72eGh8CvePPOMPccAs5FlSl4oINL7pVMtM=;
 b=B2S8YZ9YpsJxk0dU1tuvqRWFLlvnG05snT+ctckM4l+S93opYg/vqogpXcU8bDR00995ic
 4ykSOwMxIsQgh6FfowCCKrPx9yuf3JeeC7nJt/I3DleiU+5VUZBehEsqu0z9vu1wG9uw9/
 7KJZfQaeXy9d+8y7NmPhab8ZI0T3MA8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-SUKvgtMmMaCAFlBboD6yjg-1; Tue, 05 May 2020 20:36:02 -0400
X-MC-Unique: SUKvgtMmMaCAFlBboD6yjg-1
Received: by mail-wm1-f72.google.com with SMTP id f128so212172wmf.8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 05 May 2020 17:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=r91Vkwfhs72eGh8CvePPOMPccAs5FlSl4oINL7pVMtM=;
 b=CNH8nZk5kAYtTgYyQvVVW09o+iPhYgJVg5PfJSAFCU1/fgAjZpU6b83hINE/kirZ0f
 JO+XfRdNuMk54bxzCthsOd6WPCZ6bvVMR81fw8TQp+m056ORpBkV4l/2yCEFTKjlt3yi
 FYdwmzDuml+jldHLMtiANc1DgOwJFcEYH0O4A8qArJV03kXN/hFghfNw46ATv7wKGyLp
 I3BDelw8/hLQ5PYGE117saMt6jHjrKunz1qamMp087wKcx8KBHVv7ZJkKixwd3/1cVf7
 23jnhAZ1Z21rsEPtkcvqGLFBYcSC6d/okcO/qlT2ASbETS+AVjTtdhw3OPy3wSy6qPAX
 ewTA==
X-Gm-Message-State: AGi0PuaOTRs6w7+4Tlgo6XgDIdRLnZLx+fRT4NQlv3m0BK9TIk7E4RrB
 xOV607lWM/x7mip/2JEs63td43xpq3APk4P0XqDc+5dtEpNjpSEyv5Z/GyjlSorJUq3TTBFDQ75
 M2kxMLIBOI3o627Mp6S+PUnx0W1/7G8Gz0bcLi/Mv0w==
X-Received: by 2002:a7b:c104:: with SMTP id w4mr1282104wmi.8.1588725361510;
 Tue, 05 May 2020 17:36:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypJVVkRFF30e3828oYhwtuf5lvADu5CEQ19rZWzkiBLQtxSA06mataKgIXrW8PxWj1Hy8UMH4g==
X-Received: by 2002:a7b:c104:: with SMTP id w4mr1282093wmi.8.1588725361342;
 Tue, 05 May 2020 17:36:01 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 g186sm506141wme.7.2020.05.05.17.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 17:36:00 -0700 (PDT)
Date: Tue, 5 May 2020 20:35:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] vdpasim: remove unused variable 'ret'
Message-ID: <20200505203544-mutt-send-email-mst@kernel.org>
References: <20200410115422.42308-1-yuehaibing@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200410115422.42308-1-yuehaibing@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gRnJpLCBBcHIgMTAsIDIwMjAgYXQgMDc6NTQ6MjJQTSArMDgwMCwgWXVlSGFpYmluZyB3cm90
ZToKPiBkcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYzo5Mjo2OiB3YXJuaW5nOgo+ICB2
YXJpYWJsZSDigJhyZXTigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJp
YWJsZV0KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5j
b20+Cj4gLS0tCgpFaXRoZXIgdGhpcywgb3IgQlVHX09OLiAgSmFzb24/Cgo+ICBkcml2ZXJzL3Zk
cGEvdmRwYV9zaW0vdmRwYV9zaW0uYyB8IDE1ICsrKysrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYyBiL2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92
ZHBhX3NpbS5jCj4gaW5kZXggNzk1N2QyZDQxZmM0Li4wMWM0NTZmN2MxZjcgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMKPiArKysgYi9kcml2ZXJzL3ZkcGEv
dmRwYV9zaW0vdmRwYV9zaW0uYwo+IEBAIC04OSwxNSArODksMTQgQEAgc3RhdGljIHN0cnVjdCB2
ZHBhc2ltICpkZXZfdG9fc2ltKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgc3RhdGljIHZvaWQgdmRw
YXNpbV9xdWV1ZV9yZWFkeShzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbSwgdW5zaWduZWQgaW50IGlk
eCkKPiAgewo+ICAJc3RydWN0IHZkcGFzaW1fdmlydHF1ZXVlICp2cSA9ICZ2ZHBhc2ltLT52cXNb
aWR4XTsKPiAtCWludCByZXQ7Cj4gIAo+IC0JcmV0ID0gdnJpbmdoX2luaXRfaW90bGIoJnZxLT52
cmluZywgdmRwYXNpbV9mZWF0dXJlcywKPiAtCQkJCVZEUEFTSU1fUVVFVUVfTUFYLCBmYWxzZSwK
PiAtCQkJCShzdHJ1Y3QgdnJpbmdfZGVzYyAqKSh1aW50cHRyX3QpdnEtPmRlc2NfYWRkciwKPiAt
CQkJCShzdHJ1Y3QgdnJpbmdfYXZhaWwgKikKPiAtCQkJCSh1aW50cHRyX3QpdnEtPmRyaXZlcl9h
ZGRyLAo+IC0JCQkJKHN0cnVjdCB2cmluZ191c2VkICopCj4gLQkJCQkodWludHB0cl90KXZxLT5k
ZXZpY2VfYWRkcik7Cj4gKwl2cmluZ2hfaW5pdF9pb3RsYigmdnEtPnZyaW5nLCB2ZHBhc2ltX2Zl
YXR1cmVzLAo+ICsJCQkgIFZEUEFTSU1fUVVFVUVfTUFYLCBmYWxzZSwKPiArCQkJICAoc3RydWN0
IHZyaW5nX2Rlc2MgKikodWludHB0cl90KXZxLT5kZXNjX2FkZHIsCj4gKwkJCSAgKHN0cnVjdCB2
cmluZ19hdmFpbCAqKQo+ICsJCQkgICh1aW50cHRyX3QpdnEtPmRyaXZlcl9hZGRyLAo+ICsJCQkg
IChzdHJ1Y3QgdnJpbmdfdXNlZCAqKQo+ICsJCQkgICh1aW50cHRyX3QpdnEtPmRldmljZV9hZGRy
KTsKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgdmRwYXNpbV92cV9yZXNldChzdHJ1Y3QgdmRwYXNp
bV92aXJ0cXVldWUgKnZxKQo+IC0tIAo+IDIuMTcuMQo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
