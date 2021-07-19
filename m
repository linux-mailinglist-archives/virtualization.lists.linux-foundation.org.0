Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B9E3CCCB4
	for <lists.virtualization@lfdr.de>; Mon, 19 Jul 2021 05:46:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA13E8364F;
	Mon, 19 Jul 2021 03:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7c6nvEmtIeTO; Mon, 19 Jul 2021 03:46:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D82218364B;
	Mon, 19 Jul 2021 03:46:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F84BC0022;
	Mon, 19 Jul 2021 03:46:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A280AC000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 03:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 724604040E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 03:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pYlyVW0JM5PT
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 03:46:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 286B640312
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 03:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626666382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yEyDmEDGfoVqfQwfMLAiRArkM1gWSjYzO4Yqw0OZBCs=;
 b=FBoEnUHsJHnC1hqA/EgDHgG0EdhsoinDPLYokBDlOhk4WUb9oRHteVVBtZgfVm67qzv4VK
 9lXGuD6DQv1FX6vxexY6ERakNC/wSBp7XWL+mMTBB1VUxbyC1AjCiUO6vpOkkqkQsRktZU
 Oex9IfJz8IUGQt9hGh02D9av/fBkNks=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-o5EI7qqTP_yCyrBSJ1SCMA-1; Sun, 18 Jul 2021 23:46:20 -0400
X-MC-Unique: o5EI7qqTP_yCyrBSJ1SCMA-1
Received: by mail-pj1-f72.google.com with SMTP id
 2-20020a17090a1942b02901738be23a47so3095577pjh.7
 for <virtualization@lists.linux-foundation.org>;
 Sun, 18 Jul 2021 20:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=yEyDmEDGfoVqfQwfMLAiRArkM1gWSjYzO4Yqw0OZBCs=;
 b=KgHyJXFwZ7BdP/dROQpmRjeje2MREGYCynpuPUgw7SgdLQcju/T70eynesWD3hXdhQ
 V4L9ITdsTCFqZWJPUkrBUg669trWRu2AO8UCWr7m65FBloE0Rc0hggVKJCbSk41UT03G
 12elGUqEBRquWOu5IeeBw4ZenkTGWgyrohs0NUA8HrgNgdyqgKlLpalxbZhiexbYtlYw
 ZmAUoXZRiRvDuKo6QDJKAR9deMS0ICt5C+crFYBb3LZZxXrgJssB+T9kAzhj4jYFUN3N
 fVjtnpkThSO937Ofqf6AMEuPzOM/N4AwziWx9x3c3osjQxt0r7xXtXE1BfM8IYd1GSPG
 8erg==
X-Gm-Message-State: AOAM530+gMIG8tD8+DZ0oGDiBoZ3OEhVXkQKr+C1hJa2EV0lUgx1wfTK
 sgUN0ML7xh2yik2ln5Hp7Z9rfG4/6wgBdk0VZc0Ci+KYimRdOe0wyDcfkmsxbhjff9euwRhXaub
 PXj1mnjPUvF7ij0vvLpfk02DTkDyrpINMrBamOubzDg==
X-Received: by 2002:a63:d648:: with SMTP id d8mr22825106pgj.280.1626666379273; 
 Sun, 18 Jul 2021 20:46:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK2PClg+T4bdNF1ejzCKJffGRKgRhP7taoldHCCR21mctqgfmU8bprULu+NF2sidpBYZ+Vvg==
X-Received: by 2002:a63:d648:: with SMTP id d8mr22825089pgj.280.1626666379115; 
 Sun, 18 Jul 2021 20:46:19 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id o10sm18100561pfu.131.2021.07.18.20.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jul 2021 20:46:18 -0700 (PDT)
Subject: Re: [PATCH] virtio-balloon: Use virtio_find_vqs() helper
To: tianxianting <xianting.tian@linux.alibaba.com>,
 Xianting Tian <xianting_tian@126.com>, mst@redhat.com, david@redhat.com
References: <1626190724-7942-1-git-send-email-xianting_tian@126.com>
 <bbe52a89-c7ea-c155-6226-0397f223cd80@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b427ac2a-e439-3675-8a42-9fdcd23a5114@redhat.com>
Date: Mon, 19 Jul 2021 11:46:11 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bbe52a89-c7ea-c155-6226-0397f223cd80@linux.alibaba.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CuWcqCAyMDIxLzcvMTYg5LiL5Y2IODo0NiwgdGlhbnhpYW50aW5nIOWGmemBkzoKPiBEbyB5b3Ug
aW50ZXJlc3QgaW4gdGhpcyBwYXRjaD8ganVzdCBsaXR0bGUgaW1wcm92bWVudDopCj4KPiDlnKgg
MjAyMS83LzEzIOS4i+WNiDExOjM4LCBYaWFudGluZyBUaWFuIOWGmemBkzoKPj4gRnJvbTogWGlh
bnRpbmcgVGlhbiA8eGlhbnRpbmcudGlhbkBsaW51eC5hbGliYWJhLmNvbT4KPj4KPj4gVXNlIHRo
ZSBoZWxwZXIgdmlydGlvX2ZpbmRfdnFzKCkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFhpYW50aW5n
IFRpYW4gPHhpYW50aW5nLnRpYW5AbGludXguYWxpYmFiYS5jb20+Cj4+IC0tLQo+PiDCoCBkcml2
ZXJzL3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5jIHwgNCArKy0tCj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5jIAo+PiBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19i
YWxsb29uLmMKPj4gaW5kZXggNTEwZTkzMS4uMThlMGJmMyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYwo+PiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9f
YmFsbG9vbi5jCj4+IEBAIC01MzEsOCArNTMxLDggQEAgc3RhdGljIGludCBpbml0X3ZxcyhzdHJ1
Y3QgdmlydGlvX2JhbGxvb24gKnZiKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY2FsbGJhY2tzW1ZJ
UlRJT19CQUxMT09OX1ZRX1JFUE9SVElOR10gPSBiYWxsb29uX2FjazsKPj4gwqDCoMKgwqDCoCB9
Cj4+IMKgIC3CoMKgwqAgZXJyID0gdmItPnZkZXYtPmNvbmZpZy0+ZmluZF92cXModmItPnZkZXYs
IFZJUlRJT19CQUxMT09OX1ZRX01BWCwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdnFzLCBjYWxsYmFja3MsIG5hbWVzLCBOVUxMLCBOVUxMKTsKPj4gK8KgwqDC
oCBlcnIgPSB2aXJ0aW9fZmluZF92cXModmItPnZkZXYsIFZJUlRJT19CQUxMT09OX1ZRX01BWCwg
dnFzLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhbGxiYWNrcywgbmFtZXMs
IE5VTEwpOwo+PiDCoMKgwqDCoMKgIGlmIChlcnIpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gZXJyOwo+CgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCk1h
eWJlIGl0J3MgYmV0dGVyIHRvIGNvbnZlcnQgYWxsIHRoZSBkcml2ZXJzIHRoYXQgZG9lc24ndCB1
c2UgCnZpcnRpb19maW5kX3Zxc3tfY3R4fS4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
