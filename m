Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 655DB6BDFAA
	for <lists.virtualization@lfdr.de>; Fri, 17 Mar 2023 04:33:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E77C41774;
	Fri, 17 Mar 2023 03:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E77C41774
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WzStaKQv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id so-OVP4Thtuq; Fri, 17 Mar 2023 03:33:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9E08C409A3;
	Fri, 17 Mar 2023 03:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E08C409A3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE7A7C0089;
	Fri, 17 Mar 2023 03:33:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17839C0032
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Mar 2023 03:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E322D81264
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Mar 2023 03:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E322D81264
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=WzStaKQv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hd5re_k_oIsy
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Mar 2023 03:33:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECC108125B
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECC108125B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Mar 2023 03:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679024021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=goLgdreS2QkUUpgFFAioCzRs6o6aj79euCwZW0bwQgc=;
 b=WzStaKQvI3gLRQAvnafsWkslCn0fPoeL+wYaOuaokZQnS7ou8En/m9NpVnjFMVFohklCWM
 KMB24s3/rts2KXSGOzubpdXVyUp7KeixHZkKmTS3JdkSYFY7783oU71HWLRnpfdILxm8S1
 BZD1eS640VuSuY5stgH0OhZI7M3fJTI=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-U6Zs8r5aNvanvxt-m9eaxA-1; Thu, 16 Mar 2023 23:33:38 -0400
X-MC-Unique: U6Zs8r5aNvanvxt-m9eaxA-1
Received: by mail-oi1-f199.google.com with SMTP id
 r133-20020acaf38b000000b00386b94ef384so1746292oih.16
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Mar 2023 20:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679024018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=goLgdreS2QkUUpgFFAioCzRs6o6aj79euCwZW0bwQgc=;
 b=XaK1uWMU6ONyQD7gjWXC+Qs9Vdkod1se3VkcxslGTN3JDgTZvcBI89LzSG+SVNPe1U
 dP+AXl/fCxPOeYtJH45aDkFAm+qCT2FWbpL8jl/2gCd5BcGk6fWOZaxylhyaND72NFrH
 2BiqRL3H5HldgvtYovvtXYuIQLe8RrGSDBZT6YG5LM29kK6kbu51uF5UZmpiymRjkx19
 JK2ABetuGpTnXmA88TWS4bj/vtSH+6cvSxCTHNxcNgbKO/mdMJ6s5Txs3JoI9l4iqSn6
 UbHk5adftrbslEeYqx9j8420fKtgbDlDAVy6FwU3rJbz0f362GAdW1YyLWas7+YMl4xW
 /zuQ==
X-Gm-Message-State: AO0yUKXLg+ZYcwV/NeNzv2Fy0R++4NCACuNh/9g7CdSJ9E+A9PS/8Ewq
 6iFe0sjtTVm3V13y1ZUKP3lNA7hsPTIayF6r7vd2vQXv8RmKHQapyg28kW3aeP27NqHf5NisrkT
 V7aiH5COKqurFOUBmjCe+FrWnMczbFBSDR2SNJB2bOsj7mEwRMKHQxq2HmQ==
X-Received: by 2002:aca:1c16:0:b0:384:4e2d:81ea with SMTP id
 c22-20020aca1c16000000b003844e2d81eamr2799673oic.9.1679024017922; 
 Thu, 16 Mar 2023 20:33:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set/pmRoQksEiseo43fD6VDuW3rOIdhRFRBkOYL1vsdo+T8jzwj6/6gMtdY9EhFQE6kKEb5ajjs2JfFxWQK7FxKY=
X-Received: by 2002:aca:1c16:0:b0:384:4e2d:81ea with SMTP id
 c22-20020aca1c16000000b003844e2d81eamr2799666oic.9.1679024017611; Thu, 16 Mar
 2023 20:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230309013046.23523-1-shannon.nelson@amd.com>
 <20230309013046.23523-3-shannon.nelson@amd.com>
 <CACGkMEumJLysw4Grd19fVF-LuUb+r201XWMaeCkT=kDqN41ZTg@mail.gmail.com>
 <ad9ab1f3-43ff-a73d-0a62-50565aa5196f@amd.com>
In-Reply-To: <ad9ab1f3-43ff-a73d-0a62-50565aa5196f@amd.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 17 Mar 2023 11:33:26 +0800
Message-ID: <CACGkMEuv9Rd0nOw3VxM9Ut25=VuWa_MTfaUxkWPwFm+vicU22Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 virtio 2/7] pds_vdpa: get vdpa management info
To: Shannon Nelson <shannon.nelson@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: brett.creeley@amd.com, mst@redhat.com, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kuba@kernel.org,
 drivers@pensando.io, davem@davemloft.net
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

T24gVGh1LCBNYXIgMTYsIDIwMjMgYXQgMTE6MjXigK9BTSBTaGFubm9uIE5lbHNvbiA8c2hhbm5v
bi5uZWxzb25AYW1kLmNvbT4gd3JvdGU6Cj4KPiBPbiAzLzE1LzIzIDEyOjA1IEFNLCBKYXNvbiBX
YW5nIHdyb3RlOgo+ID4gT24gVGh1LCBNYXIgOSwgMjAyMyBhdCA5OjMx4oCvQU0gU2hhbm5vbiBO
ZWxzb24gPHNoYW5ub24ubmVsc29uQGFtZC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gRmluZCB0aGUg
dkRQQSBtYW5hZ2VtZW50IGluZm9ybWF0aW9uIGZyb20gdGhlIERTQyBpbiBvcmRlciB0bwo+ID4+
IGFkdmVydGlzZSBpdCB0byB0aGUgdmRwYSBzdWJzeXN0ZW0uCj4gPj4KPiA+PiBTaWduZWQtb2Zm
LWJ5OiBTaGFubm9uIE5lbHNvbiA8c2hhbm5vbi5uZWxzb25AYW1kLmNvbT4KPiA+PiAtLS0KPiA+
PiAgIGRyaXZlcnMvdmRwYS9wZHMvTWFrZWZpbGUgICAgfCAgIDMgKy0KPiA+PiAgIGRyaXZlcnMv
dmRwYS9wZHMvYXV4X2Rydi5jICAgfCAgMTMgKysrKwo+ID4+ICAgZHJpdmVycy92ZHBhL3Bkcy9h
dXhfZHJ2LmggICB8ICAgNyArKysKPiA+PiAgIGRyaXZlcnMvdmRwYS9wZHMvZGVidWdmcy5jICAg
fCAgIDMgKwo+ID4+ICAgZHJpdmVycy92ZHBhL3Bkcy92ZHBhX2Rldi5jICB8IDExMyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4+ICAgZHJpdmVycy92ZHBhL3Bkcy92ZHBh
X2Rldi5oICB8ICAxNSArKysrKwo+ID4+ICAgaW5jbHVkZS9saW51eC9wZHMvcGRzX3ZkcGEuaCB8
ICA5MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPj4gICA3IGZpbGVzIGNoYW5nZWQs
IDI0NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy92ZHBhL3Bkcy92ZHBhX2Rldi5jCj4gPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy92ZHBhL3Bkcy92ZHBhX2Rldi5oCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92ZHBhL3Bkcy9NYWtlZmlsZSBiL2RyaXZlcnMvdmRwYS9wZHMvTWFrZWZpbGUKPiA+PiBpbmRl
eCBhOWNkMmY0NTBhZTEuLjEzYjUwMzk0ZWM2NCAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL3Zk
cGEvcGRzL01ha2VmaWxlCj4gPj4gKysrIGIvZHJpdmVycy92ZHBhL3Bkcy9NYWtlZmlsZQo+ID4+
IEBAIC0zLDYgKzMsNyBAQAo+ID4+Cj4gPj4gICBvYmotJChDT05GSUdfUERTX1ZEUEEpIDo9IHBk
c192ZHBhLm8KPiA+Pgo+ID4+IC1wZHNfdmRwYS15IDo9IGF1eF9kcnYubwo+ID4+ICtwZHNfdmRw
YS15IDo9IGF1eF9kcnYubyBcCj4gPj4gKyAgICAgICAgICAgICB2ZHBhX2Rldi5vCj4gPj4KPiA+
PiAgIHBkc192ZHBhLSQoQ09ORklHX0RFQlVHX0ZTKSArPSBkZWJ1Z2ZzLm8KPiA+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92ZHBhL3Bkcy9hdXhfZHJ2LmMgYi9kcml2ZXJzL3ZkcGEvcGRzL2F1eF9k
cnYuYwo+ID4+IGluZGV4IGIzZjM2MTcwMjUzYy4uNjNlNDBhZTY4MjExIDEwMDY0NAo+ID4+IC0t
LSBhL2RyaXZlcnMvdmRwYS9wZHMvYXV4X2Rydi5jCj4gPj4gKysrIGIvZHJpdmVycy92ZHBhL3Bk
cy9hdXhfZHJ2LmMKPiA+PiBAQCAtMiw2ICsyLDggQEAKPiA+PiAgIC8qIENvcHlyaWdodChjKSAy
MDIzIEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYyAqLwo+ID4+Cj4gPj4gICAjaW5jbHVkZSA8
bGludXgvYXV4aWxpYXJ5X2J1cy5oPgo+ID4+ICsjaW5jbHVkZSA8bGludXgvcGNpLmg+Cj4gPj4g
KyNpbmNsdWRlIDxsaW51eC92ZHBhLmg+Cj4gPj4KPiA+PiAgICNpbmNsdWRlIDxsaW51eC9wZHMv
cGRzX2NvcmUuaD4KPiA+PiAgICNpbmNsdWRlIDxsaW51eC9wZHMvcGRzX2F1eGJ1cy5oPgo+ID4+
IEBAIC05LDYgKzExLDcgQEAKPiA+Pgo+ID4+ICAgI2luY2x1ZGUgImF1eF9kcnYuaCIKPiA+PiAg
ICNpbmNsdWRlICJkZWJ1Z2ZzLmgiCj4gPj4gKyNpbmNsdWRlICJ2ZHBhX2Rldi5oIgo+ID4+Cj4g
Pj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGF1eGlsaWFyeV9kZXZpY2VfaWQgcGRzX3ZkcGFfaWRf
dGFibGVbXSA9IHsKPiA+PiAgICAgICAgICB7IC5uYW1lID0gUERTX1ZEUEFfREVWX05BTUUsIH0s
Cj4gPj4gQEAgLTMwLDYgKzMzLDcgQEAgc3RhdGljIGludCBwZHNfdmRwYV9wcm9iZShzdHJ1Y3Qg
YXV4aWxpYXJ5X2RldmljZSAqYXV4X2RldiwKPiA+PiAgICAgICAgICAgICAgICAgIHJldHVybiAt
RU5PTUVNOwo+ID4+Cj4gPj4gICAgICAgICAgdmRwYV9hdXgtPnBhZGV2ID0gcGFkZXY7Cj4gPj4g
KyAgICAgICB2ZHBhX2F1eC0+dmZfaWQgPSBwY2lfaW92X3ZmX2lkKHBhZGV2LT52Zi0+cGRldik7
Cj4gPj4gICAgICAgICAgYXV4aWxpYXJ5X3NldF9kcnZkYXRhKGF1eF9kZXYsIHZkcGFfYXV4KTsK
PiA+Pgo+ID4+ICAgICAgICAgIC8qIFJlZ2lzdGVyIG91ciBQRFMgY2xpZW50IHdpdGggdGhlIHBk
c19jb3JlICovCj4gPj4gQEAgLTQwLDggKzQ0LDE1IEBAIHN0YXRpYyBpbnQgcGRzX3ZkcGFfcHJv
YmUoc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmF1eF9kZXYsCj4gPj4gICAgICAgICAgICAgICAg
ICBnb3RvIGVycl9mcmVlX21lbTsKPiA+PiAgICAgICAgICB9Cj4gPj4KPiA+PiArICAgICAgIC8q
IEdldCBkZXZpY2UgaWRlbnQgaW5mbyBhbmQgc2V0IHVwIHRoZSB2ZHBhX21nbXRfZGV2ICovCj4g
Pj4gKyAgICAgICBlcnIgPSBwZHNfdmRwYV9nZXRfbWdtdF9pbmZvKHZkcGFfYXV4KTsKPiA+PiAr
ICAgICAgIGlmIChlcnIpCj4gPj4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyX2F1eF91bnJlZzsK
PiA+PiArCj4gPj4gICAgICAgICAgcmV0dXJuIDA7Cj4gPj4KPiA+PiArZXJyX2F1eF91bnJlZzoK
PiA+PiArICAgICAgIHBhZGV2LT5vcHMtPnVucmVnaXN0ZXJfY2xpZW50KHBhZGV2KTsKPiA+PiAg
IGVycl9mcmVlX21lbToKPiA+PiAgICAgICAgICBrZnJlZSh2ZHBhX2F1eCk7Cj4gPj4gICAgICAg
ICAgYXV4aWxpYXJ5X3NldF9kcnZkYXRhKGF1eF9kZXYsIE5VTEwpOwo+ID4+IEBAIC01NCw2ICs2
NSw4IEBAIHN0YXRpYyB2b2lkIHBkc192ZHBhX3JlbW92ZShzdHJ1Y3QgYXV4aWxpYXJ5X2Rldmlj
ZSAqYXV4X2RldikKPiA+PiAgICAgICAgICBzdHJ1Y3QgcGRzX3ZkcGFfYXV4ICp2ZHBhX2F1eCA9
IGF1eGlsaWFyeV9nZXRfZHJ2ZGF0YShhdXhfZGV2KTsKPiA+PiAgICAgICAgICBzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmYXV4X2Rldi0+ZGV2Owo+ID4+Cj4gPj4gKyAgICAgICBwY2lfZnJlZV9pcnFf
dmVjdG9ycyh2ZHBhX2F1eC0+cGFkZXYtPnZmLT5wZGV2KTsKPiA+PiArCj4gPj4gICAgICAgICAg
dmRwYV9hdXgtPnBhZGV2LT5vcHMtPnVucmVnaXN0ZXJfY2xpZW50KHZkcGFfYXV4LT5wYWRldik7
Cj4gPj4KPiA+PiAgICAgICAgICBrZnJlZSh2ZHBhX2F1eCk7Cj4gPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmRwYS9wZHMvYXV4X2Rydi5oIGIvZHJpdmVycy92ZHBhL3Bkcy9hdXhfZHJ2LmgKPiA+
PiBpbmRleCAxNGU0NjU5NDRkZmQuLjk0YmE3YWJjYWE0MyAxMDA2NDQKPiA+PiAtLS0gYS9kcml2
ZXJzL3ZkcGEvcGRzL2F1eF9kcnYuaAo+ID4+ICsrKyBiL2RyaXZlcnMvdmRwYS9wZHMvYXV4X2Ry
di5oCj4gPj4gQEAgLTEwLDYgKzEwLDEzIEBACj4gPj4gICBzdHJ1Y3QgcGRzX3ZkcGFfYXV4IHsK
PiA+PiAgICAgICAgICBzdHJ1Y3QgcGRzX2F1eGlsaWFyeV9kZXYgKnBhZGV2Owo+ID4+Cj4gPj4g
KyAgICAgICBzdHJ1Y3QgdmRwYV9tZ210X2RldiB2ZHBhX21kZXY7Cj4gPj4gKwo+ID4+ICsgICAg
ICAgc3RydWN0IHBkc192ZHBhX2lkZW50IGlkZW50Owo+ID4+ICsKPiA+PiArICAgICAgIGludCB2
Zl9pZDsKPiA+PiAgICAgICAgICBzdHJ1Y3QgZGVudHJ5ICpkZW50cnk7Cj4gPj4gKwo+ID4+ICsg
ICAgICAgaW50IG5pbnRyczsKPiA+PiAgIH07Cj4gPj4gICAjZW5kaWYgLyogX0FVWF9EUlZfSF8g
Ki8KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL3Bkcy9kZWJ1Z2ZzLmMgYi9kcml2ZXJz
L3ZkcGEvcGRzL2RlYnVnZnMuYwo+ID4+IGluZGV4IDNjMTYzZGM3YjY2Zi4uN2I3ZTkwZmQ2NTc4
IDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvdmRwYS9wZHMvZGVidWdmcy5jCj4gPj4gKysrIGIv
ZHJpdmVycy92ZHBhL3Bkcy9kZWJ1Z2ZzLmMKPiA+PiBAQCAtMSw3ICsxLDEwIEBACj4gPj4gICAv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gPj4gICAvKiBDb3B5cmln
aHQoYykgMjAyMyBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMgKi8KPiA+Pgo+ID4+ICsjaW5j
bHVkZSA8bGludXgvdmRwYS5oPgo+ID4+ICsKPiA+PiAgICNpbmNsdWRlIDxsaW51eC9wZHMvcGRz
X2NvcmUuaD4KPiA+PiArI2luY2x1ZGUgPGxpbnV4L3Bkcy9wZHNfdmRwYS5oPgo+ID4+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3Bkcy9wZHNfYXV4YnVzLmg+Cj4gPj4KPiA+PiAgICNpbmNsdWRlICJhdXhf
ZHJ2LmgiCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS9wZHMvdmRwYV9kZXYuYyBiL2Ry
aXZlcnMvdmRwYS9wZHMvdmRwYV9kZXYuYwo+ID4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPj4g
aW5kZXggMDAwMDAwMDAwMDAwLi5iZDg0MDY4ODUwM2MKPiA+PiAtLS0gL2Rldi9udWxsCj4gPj4g
KysrIGIvZHJpdmVycy92ZHBhL3Bkcy92ZHBhX2Rldi5jCj4gPj4gQEAgLTAsMCArMSwxMTMgQEAK
PiA+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ID4+ICsvKiBD
b3B5cmlnaHQoYykgMjAyMyBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMgKi8KPiA+PiArCj4g
Pj4gKyNpbmNsdWRlIDxsaW51eC9wY2kuaD4KPiA+PiArI2luY2x1ZGUgPGxpbnV4L3ZkcGEuaD4K
PiA+PiArI2luY2x1ZGUgPHVhcGkvbGludXgvdmRwYS5oPgo+ID4+ICsKPiA+PiArI2luY2x1ZGUg
PGxpbnV4L3Bkcy9wZHNfY29yZS5oPgo+ID4+ICsjaW5jbHVkZSA8bGludXgvcGRzL3Bkc19hZG1p
bnEuaD4KPiA+PiArI2luY2x1ZGUgPGxpbnV4L3Bkcy9wZHNfYXV4YnVzLmg+Cj4gPj4gKyNpbmNs
dWRlIDxsaW51eC9wZHMvcGRzX3ZkcGEuaD4KPiA+PiArCj4gPj4gKyNpbmNsdWRlICJ2ZHBhX2Rl
di5oIgo+ID4+ICsjaW5jbHVkZSAiYXV4X2Rydi5oIgo+ID4+ICsKPiA+PiArc3RhdGljIHN0cnVj
dCB2aXJ0aW9fZGV2aWNlX2lkIHBkc192ZHBhX2lkX3RhYmxlW10gPSB7Cj4gPj4gKyAgICAgICB7
VklSVElPX0lEX05FVCwgVklSVElPX0RFVl9BTllfSUR9LAo+ID4+ICsgICAgICAgezB9LAo+ID4+
ICt9Owo+ID4+ICsKPiA+PiArc3RhdGljIGludCBwZHNfdmRwYV9kZXZfYWRkKHN0cnVjdCB2ZHBh
X21nbXRfZGV2ICptZGV2LCBjb25zdCBjaGFyICpuYW1lLAo+ID4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdmRwYV9kZXZfc2V0X2NvbmZpZyAqYWRkX2NvbmZpZykK
PiA+PiArewo+ID4+ICsgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4+ICt9Cj4gPj4gKwo+
ID4+ICtzdGF0aWMgdm9pZCBwZHNfdmRwYV9kZXZfZGVsKHN0cnVjdCB2ZHBhX21nbXRfZGV2ICpt
ZGV2LAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZkcGFfZGV2aWNl
ICp2ZHBhX2RldikKPiA+PiArewo+ID4+ICt9Cj4gPj4gKwo+ID4+ICtzdGF0aWMgY29uc3Qgc3Ry
dWN0IHZkcGFfbWdtdGRldl9vcHMgcGRzX3ZkcGFfbWdtdF9kZXZfb3BzID0gewo+ID4+ICsgICAg
ICAgLmRldl9hZGQgPSBwZHNfdmRwYV9kZXZfYWRkLAo+ID4+ICsgICAgICAgLmRldl9kZWwgPSBw
ZHNfdmRwYV9kZXZfZGVsCj4gPj4gK307Cj4gPj4gKwo+ID4+ICtpbnQgcGRzX3ZkcGFfZ2V0X21n
bXRfaW5mbyhzdHJ1Y3QgcGRzX3ZkcGFfYXV4ICp2ZHBhX2F1eCkKPiA+PiArewo+ID4+ICsgICAg
ICAgc3RydWN0IHBkc192ZHBhX2lkZW50X2NtZCBpZGVudF9jbWQgPSB7Cj4gPj4gKyAgICAgICAg
ICAgICAgIC5vcGNvZGUgPSBQRFNfVkRQQV9DTURfSURFTlQsCj4gPj4gKyAgICAgICAgICAgICAg
IC52Zl9pZCA9IGNwdV90b19sZTE2KHZkcGFfYXV4LT52Zl9pZCksCj4gPj4gKyAgICAgICB9Owo+
ID4+ICsgICAgICAgc3RydWN0IHBkc192ZHBhX2NvbXAgaWRlbnRfY29tcCA9IHswfTsKPiA+PiAr
ICAgICAgIHN0cnVjdCB2ZHBhX21nbXRfZGV2ICptZ210Owo+ID4+ICsgICAgICAgc3RydWN0IGRl
dmljZSAqcGZfZGV2Owo+ID4+ICsgICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXY7Cj4gPj4gKyAg
ICAgICBkbWFfYWRkcl90IGlkZW50X3BhOwo+ID4+ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2
Owo+ID4+ICsgICAgICAgdTE2IG1heF92cXM7Cj4gPj4gKyAgICAgICBpbnQgZXJyOwo+ID4+ICsK
PiA+PiArICAgICAgIGRldiA9ICZ2ZHBhX2F1eC0+cGFkZXYtPmF1eF9kZXYuZGV2Owo+ID4+ICsg
ICAgICAgcGRldiA9IHZkcGFfYXV4LT5wYWRldi0+dmYtPnBkZXY7Cj4gPj4gKyAgICAgICBtZ210
ID0gJnZkcGFfYXV4LT52ZHBhX21kZXY7Cj4gPj4gKwo+ID4+ICsgICAgICAgLyogR2V0IHJlc291
cmNlIGluZm8gdGhyb3VnaCB0aGUgUEYncyBhZG1pbnEuICBJdCBpcyBhIGJsb2NrIG9mIGluZm8s
Cj4gPj4gKyAgICAgICAgKiBzbyB3ZSBuZWVkIHRvIG1hcCBzb21lIG1lbW9yeSBmb3IgUEYgdG8g
bWFrZSBhdmFpbGFibGUgdG8gdGhlCj4gPj4gKyAgICAgICAgKiBmaXJtd2FyZSBmb3Igd3JpdGlu
ZyB0aGUgZGF0YS4KPiA+PiArICAgICAgICAqLwo+ID4KPiA+IEl0IGxvb2tzIHRvIG1lIHBkc192
ZHBhX2lkZW50IGlzIG5vdCB2ZXJ5IGxhcmdlOgo+ID4KPiA+IHN0cnVjdCBwZHNfdmRwYV9pZGVu
dCB7Cj4gPiAgICAgICAgICBfX2xlNjQgaHdfZmVhdHVyZXM7Cj4gPiAgICAgICAgICBfX2xlMTYg
bWF4X3ZxczsKPiA+ICAgICAgICAgIF9fbGUxNiBtYXhfcWxlbjsKPiA+ICAgICAgICAgIF9fbGUx
NiBtaW5fcWxlbjsKPiA+IH07Cj4gPgo+ID4gQW55IHJlYXNvbiBpdCBpcyBub3QgcGFja2VkIGlu
dG8gc29tZSB0eXBlIG9mIHRoZSBjb21wIHN0cnVjdHVyZSBvZiBhZG1pbnE/Cj4KPiBVbmZvcnR1
bmF0ZWx5LCB0aGUgY29tcGxldGlvbiBzdHJ1Y3RzIGFyZSBsaW1pdGVkIHRvIDE2IGJ5dGVzLCB3
aXRoIDQgdXAKPiBmcm9udCBhbmQgMSBhdCB0aGUgZW5kIGFscmVhZHkgc3Bva2VuIGZvci4gIEkg
c3VwcG9zZSB3ZSBjb3VsZCBzaHJpbmsKPiBtYXhfdnFzIHRvIGEgc2luZ2xlIGJ5dGUgYW5kIHNx
dWVlemUgdGhpcyBpbnRvIHRoZSBjb21wLCBidXQgdGhlbiB3ZSdkCj4gaGF2ZSBubyBhYmlsaXR5
IHRvIGFkZCB0byBpdCBpZiBuZWVkZWQuICBJJ2QgcmF0aGVyIGxlYXZlIGl0IGFzIGl0IGlzCj4g
Zm9yIG5vdy4KCkZpbmUuCgpUaGFua3MKCj4KPiBzbG4KPgo+ID4KPiA+IE90aGVycyBsb29rIGdv
b2QuCj4gPgo+ID4gVGhhbmtzCj4gPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
