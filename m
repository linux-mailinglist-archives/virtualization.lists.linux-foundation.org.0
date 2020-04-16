Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF3B1AC144
	for <lists.virtualization@lfdr.de>; Thu, 16 Apr 2020 14:32:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 66E5A221CC;
	Thu, 16 Apr 2020 12:32:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cyg+o-tYo7im; Thu, 16 Apr 2020 12:32:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 92789221C6;
	Thu, 16 Apr 2020 12:32:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78FBFC0172;
	Thu, 16 Apr 2020 12:32:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8D4BC0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 12:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D3191859B1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 12:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qfq9ZZDJa7DZ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 12:32:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 049A2859AE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 12:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587040350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0VyMwAzowexFZjgtgFRovq2sXpLz94EE6LhxQbSKU6M=;
 b=IaBPxtqJ4C1CzKSwVa0zZdUBWZSN5kHjlwu5CadcFacKuPa/kpHceIygcH2S4ombn+o6CF
 Q19omQ/PYVtKY5l07PfBsbuYRFneUnmKP25AtxPRgKbdJIF432KylwGayVDTu6+vg8pDXn
 ijNRJiVt+Yd5Av8yY+c9vxq0bwXDgaU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-ZbLptMWBO-OjrgjzEx95Ig-1; Thu, 16 Apr 2020 08:32:29 -0400
X-MC-Unique: ZbLptMWBO-OjrgjzEx95Ig-1
Received: by mail-wr1-f69.google.com with SMTP id h14so1627257wrr.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 05:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0VyMwAzowexFZjgtgFRovq2sXpLz94EE6LhxQbSKU6M=;
 b=J5fROlbnyT9vfkm8VTELafVDOv6GkKfcGUpY/6bTbhM5Zam/4ILPBbPPRocSJMyunw
 r686a2f3MhX7v1ToM3/r1c/SyngU8ovd1XLaPDBh35KE06s2o2EeGyr7E4nrer/CFDi5
 ohNxP2myibiPgRIsCbEQ+pMEmeNS0zLOyy5j7a9R8HymUP2P4yCWk27Cp+q/IQN+wOc2
 tcYcP7oig3zk45BYgNO0Ad5hSXWuBafHW1I/56eTAJy5l+HIfr48NhZO0yFF4477OPtV
 vFdcUZCJEWPjOYaUiBPaHtp+Dp8tBFr8Zx+scjTQQr2B/fiflhvD8gjaEvajR6Z6duNg
 GmMQ==
X-Gm-Message-State: AGi0PuZl0WnlrGUHrqef4I+SqiLWjYfIq06Ki9jGuX8AjXyswfen8Ci0
 HLMxAYW4qwuO5d/qgkg1bzr45/mUS18NbQ2uUUgg/2CIBNlkUL2x/t04liQIbCpTGMS+eU5UQmd
 O8RKxMTBn9zU+KibzEjPARUMuwhor+VsZ/3TEwqaQ6w==
X-Received: by 2002:adf:dc06:: with SMTP id t6mr30558902wri.385.1587040348033; 
 Thu, 16 Apr 2020 05:32:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypIfoJajvWS7IEEc1sc0ClwIXFD0DzNYfYWsVh5RONPu0C09BwqAJcBPfglPDU6iaP06YIqewA==
X-Received: by 2002:adf:dc06:: with SMTP id t6mr30558886wri.385.1587040347864; 
 Thu, 16 Apr 2020 05:32:27 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id p10sm26656903wrm.6.2020.04.16.05.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 05:32:27 -0700 (PDT)
Date: Thu, 16 Apr 2020 08:32:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: linux-next: Tree for Apr 15 (vdpa)
Message-ID: <20200416082248-mutt-send-email-mst@kernel.org>
References: <20200415152240.2422e06c@canb.auug.org.au>
 <620e1646-5899-a077-b9de-95443887364d@infradead.org>
 <33e4922f-d2b5-f3fa-4d32-a5db5a177238@redhat.com>
MIME-Version: 1.0
In-Reply-To: <33e4922f-d2b5-f3fa-4d32-a5db5a177238@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Randy Dunlap <rdunlap@infradead.org>,
 virtualization@lists.linux-foundation.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

T24gVGh1LCBBcHIgMTYsIDIwMjAgYXQgMTI6MDc6MDZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvMTYg5LiK5Y2IMTI6MTYsIFJhbmR5IER1bmxhcCB3cm90ZToKPiA+
IE9uIDQvMTQvMjAgMTA6MjIgUE0sIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6Cj4gPiA+IEhpIGFs
bCwKPiA+ID4gCj4gPiA+IENoYW5nZXMgc2luY2UgMjAyMDA0MTQ6Cj4gPiA+IAo+ID4gb24geDg2
XzY0Ogo+ID4gCj4gPiBFUlJPUjogbW9kcG9zdDogInZyaW5naF9zZXRfaW90bGIiIFtkcml2ZXJz
L3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0ua29dIHVuZGVmaW5lZCEKPiA+IEVSUk9SOiBtb2Rwb3N0
OiAidnJpbmdoX2luaXRfaW90bGIiIFtkcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0ua29d
IHVuZGVmaW5lZCEKPiA+IEVSUk9SOiBtb2Rwb3N0OiAidnJpbmdoX2lvdl9wdXNoX2lvdGxiIiBb
ZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmtvXSB1bmRlZmluZWQhCj4gPiBFUlJPUjog
bW9kcG9zdDogInZyaW5naF9pb3ZfcHVsbF9pb3RsYiIgW2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92
ZHBhX3NpbS5rb10gdW5kZWZpbmVkIQo+ID4gRVJST1I6IG1vZHBvc3Q6ICJ2cmluZ2hfY29tcGxl
dGVfaW90bGIiIFtkcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0ua29dIHVuZGVmaW5lZCEK
PiA+IEVSUk9SOiBtb2Rwb3N0OiAidnJpbmdoX2dldGRlc2NfaW90bGIiIFtkcml2ZXJzL3ZkcGEv
dmRwYV9zaW0vdmRwYV9zaW0ua29dIHVuZGVmaW5lZCEKPiA+IAo+ID4gCj4gPiBGdWxsIHJhbmRj
b25maWcgZmlsZSBpcyBhdHRhY2hlZC4KPiA+IAo+IAo+IFRoZSBjb25maWcgaGFzCj4gCj4gQ09O
RklHX1ZIT1NUX0lPVExCPW0KPiBDT05GSUdfVkhPU1RfUklORz15Cj4gCj4gQnV0IHdlIGRvbid0
IHNlbGVjdCBWSE9TVF9JT1RMQiBpbiBWSE9TVF9SSU5HIGFmdGVyIGNvbW1pdAo+IGU2ZmFlYWEx
Mjg0MTcoInZob3N0OiBkcm9wIHZyaW5nIGRlcGVuZGVuY3kgb24gaW90bGIiKS4gV2hpY2ggc2Vl
bXMgd3JvbmcuCj4gCj4gVGhhbmtzCgpXZWxsIHNlbGVjdGluZyBJT1RMQiBmcm9tIHJpbmcgYnJl
YWtzIGNvbmZpZ3Mgd2hpY2ggZG9uJ3QgbmVlZCBJT1RMQi4KCkxlZ2FsIGNvbmZpZ3VyYXRpb25z
IGFyZToKCkNPTkZJR19WSE9TVF9JT1RMQj15CkNPTkZJR19WSE9TVF9SSU5HPW4KCkNPTkZJR19W
SE9TVF9JT1RMQj1tCkNPTkZJR19WSE9TVF9SSU5HPW4KCkNPTkZJR19WSE9TVF9JT1RMQj1uCkNP
TkZJR19WSE9TVF9SSU5HPW4KCkNPTkZJR19WSE9TVF9JT1RMQj15CkNPTkZJR19WSE9TVF9SSU5H
PXkKCkNPTkZJR19WSE9TVF9JT1RMQj1uCkNPTkZJR19WSE9TVF9SSU5HPXkKCkNPTkZJR19WSE9T
VF9JT1RMQj1uCkNPTkZJR19WSE9TVF9SSU5HPW0KCkNPTkZJR19WSE9TVF9JT1RMQj15CkNPTkZJ
R19WSE9TVF9SSU5HPW0KCkNPTkZJR19WSE9TVF9JT1RMQj1tCkNPTkZJR19WSE9TVF9SSU5HPW0K
CgpTbyBWSE9TVF9SSU5HPXkgYW5kIFZIT1NUX0lPVExCPW0gaXMgdGhlIG9ubHkgaWxsZWdhbCBv
bmUuCgoKLS0gCk1TVAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
