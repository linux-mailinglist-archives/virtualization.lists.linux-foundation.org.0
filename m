Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 497FF21B07E
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 09:47:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E1AFE2077C;
	Fri, 10 Jul 2020 07:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JW2pYivnCi0j; Fri, 10 Jul 2020 07:47:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0BDBB2046D;
	Fri, 10 Jul 2020 07:47:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0861C016F;
	Fri, 10 Jul 2020 07:47:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35572C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 07:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1B091898CF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 07:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4zviPq+jeaEL
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 07:47:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3E2D78980D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594367220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JdHl2OiH4p6Iz0SiMtzkS/pKFwgmTmJSXShGkd+cqo8=;
 b=LY6Jmt1cbrhbYEt3uUVSAq3bRZ5IgWo+tOqvlJ6vJpAYzBDGrqlIAIevQfL6z/HX1zAQ5t
 +JAQkNDX7adPFmLu5Vhxkf0B5gMXT+KLrl0WA0opqJLrEPgBJHcjinn3kFsrOY3dlkQKiZ
 ohIOvzyVJS4ZGPE5wOj6c+IpYuDW6c4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-lHqh4FmcMauIxdkxQdpLDg-1; Fri, 10 Jul 2020 03:46:57 -0400
X-MC-Unique: lHqh4FmcMauIxdkxQdpLDg-1
Received: by mail-wr1-f69.google.com with SMTP id j5so5055670wro.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 00:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JdHl2OiH4p6Iz0SiMtzkS/pKFwgmTmJSXShGkd+cqo8=;
 b=DCn+9R+vj9KkW45nO2F4iC4/USR2nmYdoLJOKRkGgwwWiS7+izj1nJXn8V3QpWi+l/
 vhwG2knqljD9nylNnUjEc7OF2exjVkMWT0cf7t6yKbI5AP1zk0LfuVyB+RhEQExI4tmn
 Ly3ulJWDSe5LULiz+lQIkKVCA3kQJCD/hVYPbSaQWiBx5tfmKniu65cdDfgi5JnTAuk5
 LFg/YV/c7PQwwjv9MxAkV6DZvEZof1m2sd1ZNYd4ZfNemNyQLvEb9COp/uoXiTHTQ1qv
 /xqlMGbmOQIduBita+nXU7PUEmGSkWkWScEFnzV6Y9+3btmkq6cAqDu2I/kk11CXgP9Q
 zk2Q==
X-Gm-Message-State: AOAM53187CbaW3pU0S9VFDumPRbZ3JErhyRTGAYrGbmuNtrV7yCibpd/
 zO7ohba/Wq1etp1U1Sj4fmux2VyI8AFrfhJBXN6WWkAgZqO3HQV9xaZDCr5whZi1dQLYeBhClT4
 nJHGjTl6396HxMMkGHmRFhRatvSiJXVRRiIAzmJb6aA==
X-Received: by 2002:a1c:b686:: with SMTP id g128mr3986787wmf.145.1594367215828; 
 Fri, 10 Jul 2020 00:46:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuGy1axXIP4NvsxIBSy6jkXMCqPU4GtMCNiYKIfYo8qhu5JkSK8NP7Ezs/ydWQoVmvN6gUlw==
X-Received: by 2002:a1c:b686:: with SMTP id g128mr3986767wmf.145.1594367215569; 
 Fri, 10 Jul 2020 00:46:55 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c?
 ([2001:b07:6468:f312:9541:9439:cb0f:89c])
 by smtp.gmail.com with ESMTPSA id k18sm8954712wrx.34.2020.07.10.00.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 00:46:55 -0700 (PDT)
Subject: Re: [PATCH] scsi: virtio_scsi: Remove unnecessary condition checks
To: Markus Elfring <Markus.Elfring@web.de>,
 Xianting Tian <xianting_tian@126.com>, linux-scsi@vger.kernel.org,
 virtualization@lists.linux-foundation.org
References: <a197f532-7020-0d8e-21bf-42bb66e8daec@web.de>
 <e87746e6-813e-7c0e-e21e-5921e759da5d@redhat.com>
 <8eb9a827-45f1-e71c-0cbf-1c29acd8e310@web.de>
 <58e3feb8-1ffb-f77f-cf3a-75222b3cd524@redhat.com>
 <9815ef2d-d0da-d197-49d7-83559d750ff1@web.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d052b441-cc4d-4b2b-1442-b1a30bed2fdb@redhat.com>
Date: Fri, 10 Jul 2020 09:46:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <9815ef2d-d0da-d197-49d7-83559d750ff1@web.de>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "James E. J. Bottomley" <jejb@linux.ibm.com>
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

T24gMTAvMDcvMjAgMDk6NDAsIE1hcmt1cyBFbGZyaW5nIHdyb3RlOgo+Pj4gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3Ry
ZWUvZHJpdmVycy9zY3NpL3ZpcnRpb19zY3NpLmM/aWQ9NDJmODIwNDBlZTY2ZGIxMzUyNWRjNmYx
NGI4NTU5ODkwYjJmNGMxYyNuOTgwCj4+Pgo+Pj4gIAlpZiAoIXZpcnRzY3NpX2NtZF9jYWNoZSkg
ewo+Pj4gIAkJcHJfZXJyKCJrbWVtX2NhY2hlX2NyZWF0ZSgpIGZvciB2aXJ0c2NzaV9jbWRfY2Fj
aGUgZmFpbGVkXG4iKTsKPj4+IC0JCWdvdG8gZXJyb3I7Cj4+PiArCQlyZXR1cm4gLUVOT01FTTsK
Pj4+ICAJfQo+Pgo+PiBDb3VsZCBiZSBkb2FibGUsIGJ1dCBJIGRvbid0IHNlZSBhIHBhcnRpY3Vs
YXIgYmVuZWZpdC4KPiAKPiBDYW4gYSBiaXQgbW9yZSDigJxjb21wbGlhbmNl4oCdICh3aXRoIHRo
ZSBMaW51eCBjb2Rpbmcgc3R5bGUpIG1hdHRlciBoZXJlPwoKTm8uCgo+PiBIYXZpbmcgYSBzaW5n
bGUgZXJyb3IgbG9vcCBpcyBhbiBhZHZhbnRhZ2UgYnkgaXRzZWxmLgo+IAo+IEkgZG8gbm90IHNl
ZSB0aGF0IGEgbG9vcCBpcyBpbnZvbHZlZCBpbiB0aGUgaW1wbGVtZW50YXRpb24gb2YgdGhlIGZ1
bmN0aW9uIOKAnGluaXTigJ0uCgpzL2xvb3AvbGFiZWwvIHNvcnJ5LgoKUGFvbG8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
