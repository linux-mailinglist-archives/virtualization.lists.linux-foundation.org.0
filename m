Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFFA6BA8AF
	for <lists.virtualization@lfdr.de>; Wed, 15 Mar 2023 08:05:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 452908144E;
	Wed, 15 Mar 2023 07:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 452908144E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IeyFyCQW
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yR9UiUQQ677w; Wed, 15 Mar 2023 07:05:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8C1A98146A;
	Wed, 15 Mar 2023 07:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C1A98146A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1FDEC007F;
	Wed, 15 Mar 2023 07:05:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 183B0C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Mar 2023 07:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7D508146A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Mar 2023 07:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7D508146A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XWoLiz5eMNlD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Mar 2023 07:05:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88E8D8144E
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88E8D8144E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Mar 2023 07:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678863948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GK7ilReN9bo1OsYk8ynoSHPpp2q3aS8NUzPtNEQ8lp4=;
 b=IeyFyCQWsUaHtrbkjGiXx5O8gU9suj48uu2H8Fj8FRIlXo6TLzgFQwkqBGc5SF1O98rPPc
 h+rv06mYNcs6pl5Q4LSi9hnyBlOXIoMwO/9P42+qepK5ab6livUrN9+0EnUQWEML2deh/A
 AFCsfCid4RR0oNR5Bq79SlCyt3YS+D8=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-Q1v4fwX1N6uTWuRgfLGEPQ-1; Wed, 15 Mar 2023 03:05:47 -0400
X-MC-Unique: Q1v4fwX1N6uTWuRgfLGEPQ-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-1765e2031ccso10547565fac.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Mar 2023 00:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678863946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GK7ilReN9bo1OsYk8ynoSHPpp2q3aS8NUzPtNEQ8lp4=;
 b=t1ybnPw3M7Id1Y9gjn8W7mZfbt5x9Tpfy3xQW2MqOCcydPnam0KN4oaBGmMyaMAJKr
 qdntb/p8/diulyP0KtpUJ0/lza7MXOmUHBox2pXjUSKfUUy7oD849BOzEbaub8Tf8fUs
 Jol/DOTy/NTNrLfo/ZP8c9zSQ+U+iuRVKiPXJGCWlBW5pcuDILJddigxqMWDCrcGm2vW
 Ku+jjc+H1PmmEuzl++Xi44sRn7N6DYZ0twNs4tOCW6M8fkdAWHxS6kEM7rmffTuVrNCi
 Tu0ZzNHn2wuhI7XztITyOo/cHdJBMVHSf02x8u028e0gnUt0MBzvesncY3Y2FdGI3SLJ
 Ru/g==
X-Gm-Message-State: AO0yUKUkJgyd7MdwAfebPl36qg9SDSKoOa2f2KzkLctydDI5gZas8S5R
 MuoOOptH0SBtiJoAnJQlkD7gzdTcY8uLJyY3B/VS49nk1S+qKspu3CouOJL+oiT6OQEMZJHX0Pr
 KfzVaCWt2iiU10/+W3rLobyxNVnUVvKM8A6N1694BnZXeRlWx676k3MtWuw==
X-Received: by 2002:a05:6871:2315:b0:177:c2fb:8cec with SMTP id
 sf21-20020a056871231500b00177c2fb8cecmr3695925oab.9.1678863946005; 
 Wed, 15 Mar 2023 00:05:46 -0700 (PDT)
X-Google-Smtp-Source: AK7set8KcrM8dHG6jtPovHcgo7AZZgpEN+/caS9S8RyxwNkv4Yu3cybwCiwoENy0G0s2/va5dDJGuUWBkn5MNPJrwwM=
X-Received: by 2002:a05:6871:2315:b0:177:c2fb:8cec with SMTP id
 sf21-20020a056871231500b00177c2fb8cecmr3695918oab.9.1678863945730; Wed, 15
 Mar 2023 00:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230309013046.23523-1-shannon.nelson@amd.com>
 <20230309013046.23523-5-shannon.nelson@amd.com>
In-Reply-To: <20230309013046.23523-5-shannon.nelson@amd.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 15 Mar 2023 15:05:34 +0800
Message-ID: <CACGkMEtcm+VeTUKw_DF=bHFpYRUyqOkhh+UEfc+ppUp5zuNVkw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 virtio 4/7] pds_vdpa: add vdpa config client
 commands
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

T24gVGh1LCBNYXIgOSwgMjAyMyBhdCA5OjMx4oCvQU0gU2hhbm5vbiBOZWxzb24gPHNoYW5ub24u
bmVsc29uQGFtZC5jb20+IHdyb3RlOgo+Cj4gVGhlc2UgYXJlIHRoZSBhZG1pbnEgY29tbWFuZHMg
dGhhdCB3aWxsIGJlIG5lZWRlZCBmb3IKPiBzZXR0aW5nIHVwIGFuZCB1c2luZyB0aGUgdkRQQSBk
ZXZpY2UuCgpJdCdzIGJldHRlciB0byBleHBsYWluIHVuZGVyIHdoaWNoIGNhc2UgdGhlIGRyaXZl
ciBzaG91bGQgdXNlIGFkbWlucSwKSSBzZWUgc29tZSBmdW5jdGlvbnMgb3ZlcmxhcCB3aXRoIGNv
bW1vbiBjb25maWd1cmF0aW9uIGNhcGFiaWxpdHkuCk1vcmUgYmVsb3cuCgo+Cj4gU2lnbmVkLW9m
Zi1ieTogU2hhbm5vbiBOZWxzb24gPHNoYW5ub24ubmVsc29uQGFtZC5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvdmRwYS9wZHMvTWFrZWZpbGUgICAgfCAgIDEgKwo+ICBkcml2ZXJzL3ZkcGEvcGRzL2Nt
ZHMuYyAgICAgIHwgMjA3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGRy
aXZlcnMvdmRwYS9wZHMvY21kcy5oICAgICAgfCAgMTYgKysrCj4gIGRyaXZlcnMvdmRwYS9wZHMv
dmRwYV9kZXYuaCAgfCAgMzYgKysrKystCj4gIGluY2x1ZGUvbGludXgvcGRzL3Bkc192ZHBhLmgg
fCAxNzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCA0
MzQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy92ZHBhL3Bkcy9jbWRzLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmRwYS9w
ZHMvY21kcy5oCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL3Bkcy9NYWtlZmlsZSBiL2Ry
aXZlcnMvdmRwYS9wZHMvTWFrZWZpbGUKPiBpbmRleCBjYTJlZmE4YzZlYjUuLjcyMTFlYmEzZDk0
MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvcGRzL01ha2VmaWxlCj4gKysrIGIvZHJpdmVy
cy92ZHBhL3Bkcy9NYWtlZmlsZQo+IEBAIC00LDYgKzQsNyBAQAo+ICBvYmotJChDT05GSUdfUERT
X1ZEUEEpIDo9IHBkc192ZHBhLm8KPgo+ICBwZHNfdmRwYS15IDo9IGF1eF9kcnYubyBcCj4gKyAg
ICAgICAgICAgICBjbWRzLm8gXAo+ICAgICAgICAgICAgICAgdmlydGlvX3BjaS5vIFwKPiAgICAg
ICAgICAgICAgIHZkcGFfZGV2Lm8KPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvcGRzL2Nt
ZHMuYyBiL2RyaXZlcnMvdmRwYS9wZHMvY21kcy5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwMDAuLjQ1NDEwNzM5MTA3Ywo+IC0tLSAvZGV2L251bGwKPiArKysgYi9k
cml2ZXJzL3ZkcGEvcGRzL2NtZHMuYwo+IEBAIC0wLDAgKzEsMjA3IEBACj4gKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiArLyogQ29weXJpZ2h0KGMpIDIwMjMgQWR2
YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jICovCj4gKwo+ICsjaW5jbHVkZSA8bGludXgvdmRwYS5o
Pgo+ICsjaW5jbHVkZSA8bGludXgvdmlydGlvX3BjaV9tb2Rlcm4uaD4KPiArCj4gKyNpbmNsdWRl
IDxsaW51eC9wZHMvcGRzX2NvcmVfaWYuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3Bkcy9wZHNfYWRt
aW5xLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9wZHMvcGRzX2F1eGJ1cy5oPgo+ICsjaW5jbHVkZSA8
bGludXgvcGRzL3Bkc192ZHBhLmg+Cj4gKwo+ICsjaW5jbHVkZSAidmRwYV9kZXYuaCIKPiArI2lu
Y2x1ZGUgImF1eF9kcnYuaCIKPiArI2luY2x1ZGUgImNtZHMuaCIKPiArCj4gK2ludCBwZHNfdmRw
YV9pbml0X2h3KHN0cnVjdCBwZHNfdmRwYV9kZXZpY2UgKnBkc3YpCj4gK3sKPiArICAgICAgIHN0
cnVjdCBwZHNfYXV4aWxpYXJ5X2RldiAqcGFkZXYgPSBwZHN2LT52ZHBhX2F1eC0+cGFkZXY7Cj4g
KyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGFkZXYtPmF1eF9kZXYuZGV2Owo+ICsgICAg
ICAgc3RydWN0IHBkc192ZHBhX2luaXRfY21kIGluaXRfY21kID0gewo+ICsgICAgICAgICAgICAg
ICAub3Bjb2RlID0gUERTX1ZEUEFfQ01EX0lOSVQsCj4gKyAgICAgICAgICAgICAgIC52ZHBhX2lu
ZGV4ID0gcGRzdi0+dmRwYV9pbmRleCwKPiArICAgICAgICAgICAgICAgLnZmX2lkID0gY3B1X3Rv
X2xlMTYocGRzdi0+dmRwYV9hdXgtPnZmX2lkKSwKPiArICAgICAgICAgICAgICAgLmxlbiA9IGNw
dV90b19sZTMyKHNpemVvZihzdHJ1Y3QgdmlydGlvX25ldF9jb25maWcpKSwKPiArICAgICAgICAg
ICAgICAgLmNvbmZpZ19wYSA9IDAsICAgLyogd2UgdXNlIHRoZSBQQ0kgc3BhY2UsIG5vdCBhbiBh
bHRlcm5hdGUgc3BhY2UgKi8KPiArICAgICAgIH07Cj4gKyAgICAgICBzdHJ1Y3QgcGRzX3ZkcGFf
Y29tcCBpbml0X2NvbXAgPSB7MH07Cj4gKyAgICAgICBpbnQgZXJyOwo+ICsKPiArICAgICAgIC8q
IEluaXRpYWxpemUgdGhlIHZkcGEvdmlydGlvIGRldmljZSAqLwo+ICsgICAgICAgZXJyID0gcGFk
ZXYtPm9wcy0+YWRtaW5xX2NtZChwYWRldiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKHVuaW9uIHBkc19jb3JlX2FkbWlucV9jbWQgKikmaW5pdF9jbWQsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihpbml0X2NtZCksCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1bmlvbiBwZHNfY29yZV9hZG1pbnFfY29t
cCAqKSZpbml0X2NvbXAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAp
Owo+ICsgICAgICAgaWYgKGVycikKPiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJGYWls
ZWQgdG8gaW5pdCBodywgc3RhdHVzICVkOiAlcGVcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgaW5pdF9jb21wLnN0YXR1cywgRVJSX1BUUihlcnIpKTsKPiArCj4gKyAgICAgICByZXR1cm4g
ZXJyOwo+ICt9Cj4gKwo+ICtpbnQgcGRzX3ZkcGFfY21kX3Jlc2V0KHN0cnVjdCBwZHNfdmRwYV9k
ZXZpY2UgKnBkc3YpCj4gK3sKClRoaXMgZnVuY3Rpb24gaXMgbm90IHVzZWQuCgpBbmQgSSB3b25k
ZXIgd2hhdCdzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gcmVzZXQgdmlhIGFkbWlucSBhbmQgcmVz
ZXQKdmlhIHBkc192ZHBhX3NldF9zdGF0dXMoMCkgPwoKPiArICAgICAgIHN0cnVjdCBwZHNfYXV4
aWxpYXJ5X2RldiAqcGFkZXYgPSBwZHN2LT52ZHBhX2F1eC0+cGFkZXY7Cj4gKyAgICAgICBzdHJ1
Y3QgZGV2aWNlICpkZXYgPSAmcGFkZXYtPmF1eF9kZXYuZGV2Owo+ICsgICAgICAgc3RydWN0IHBk
c192ZHBhX2NtZCBjbWQgPSB7Cj4gKyAgICAgICAgICAgICAgIC5vcGNvZGUgPSBQRFNfVkRQQV9D
TURfUkVTRVQsCj4gKyAgICAgICAgICAgICAgIC52ZHBhX2luZGV4ID0gcGRzdi0+dmRwYV9pbmRl
eCwKPiArICAgICAgICAgICAgICAgLnZmX2lkID0gY3B1X3RvX2xlMTYocGRzdi0+dmRwYV9hdXgt
PnZmX2lkKSwKPiArICAgICAgIH07Cj4gKyAgICAgICBzdHJ1Y3QgcGRzX3ZkcGFfY29tcCBjb21w
ID0gezB9Owo+ICsgICAgICAgaW50IGVycjsKPiArCj4gKyAgICAgICBlcnIgPSBwYWRldi0+b3Bz
LT5hZG1pbnFfY21kKHBhZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAodW5pb24gcGRzX2NvcmVfYWRtaW5xX2NtZCAqKSZjbWQsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNpemVvZihjbWQpLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAodW5pb24gcGRzX2NvcmVfYWRtaW5xX2NvbXAgKikmY29tcCwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCk7Cj4gKyAgICAgICBpZiAoZXJyKQo+
ICsgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byByZXNldCBodywgc3RhdHVz
ICVkOiAlcGVcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcC5zdGF0dXMsIEVSUl9Q
VFIoZXJyKSk7CgpJdCBtaWdodCBiZSBiZXR0ZXIgdG8gdXNlIGRlYl9kYmcoKSBoZXJlIHNpbmNl
IGl0IGNhbiBiZSB0cmlnZ2VyZWQgYnkgdGhlIGd1ZXN0LgoKPiArCj4gKyAgICAgICByZXR1cm4g
ZXJyOwo+ICt9Cj4gKwo+ICtpbnQgcGRzX3ZkcGFfY21kX3NldF9tYWMoc3RydWN0IHBkc192ZHBh
X2RldmljZSAqcGRzdiwgdTggKm1hYykKPiArewo+ICsgICAgICAgc3RydWN0IHBkc19hdXhpbGlh
cnlfZGV2ICpwYWRldiA9IHBkc3YtPnZkcGFfYXV4LT5wYWRldjsKPiArICAgICAgIHN0cnVjdCBk
ZXZpY2UgKmRldiA9ICZwYWRldi0+YXV4X2Rldi5kZXY7Cj4gKyAgICAgICBzdHJ1Y3QgcGRzX3Zk
cGFfc2V0YXR0cl9jbWQgY21kID0gewo+ICsgICAgICAgICAgICAgICAub3Bjb2RlID0gUERTX1ZE
UEFfQ01EX1NFVF9BVFRSLAo+ICsgICAgICAgICAgICAgICAudmRwYV9pbmRleCA9IHBkc3YtPnZk
cGFfaW5kZXgsCj4gKyAgICAgICAgICAgICAgIC52Zl9pZCA9IGNwdV90b19sZTE2KHBkc3YtPnZk
cGFfYXV4LT52Zl9pZCksCj4gKyAgICAgICAgICAgICAgIC5hdHRyID0gUERTX1ZEUEFfQVRUUl9N
QUMsCj4gKyAgICAgICB9Owo+ICsgICAgICAgc3RydWN0IHBkc192ZHBhX2NvbXAgY29tcCA9IHsw
fTsKPiArICAgICAgIGludCBlcnI7Cj4gKwo+ICsgICAgICAgZXRoZXJfYWRkcl9jb3B5KGNtZC5t
YWMsIG1hYyk7Cj4gKyAgICAgICBlcnIgPSBwYWRldi0+b3BzLT5hZG1pbnFfY21kKHBhZGV2LAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodW5pb24gcGRzX2NvcmVfYWRt
aW5xX2NtZCAqKSZjbWQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNp
emVvZihjbWQpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodW5pb24g
cGRzX2NvcmVfYWRtaW5xX2NvbXAgKikmY29tcCwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMCk7Cj4gKyAgICAgICBpZiAoZXJyKQo+ICsgICAgICAgICAgICAgICBkZXZf
ZXJyKGRldiwgIkZhaWxlZCB0byBzZXQgbWFjIGFkZHJlc3MgJXBNLCBzdGF0dXMgJWQ6ICVwZVxu
IiwKPiArICAgICAgICAgICAgICAgICAgICAgICBtYWMsIGNvbXAuc3RhdHVzLCBFUlJfUFRSKGVy
cikpOwo+ICsKPiArICAgICAgIHJldHVybiBlcnI7Cj4gK30KPiArCj4gK2ludCBwZHNfdmRwYV9j
bWRfc2V0X21heF92cV9wYWlycyhzdHJ1Y3QgcGRzX3ZkcGFfZGV2aWNlICpwZHN2LCB1MTYgbWF4
X3ZxcCkKPiArewo+ICsgICAgICAgc3RydWN0IHBkc19hdXhpbGlhcnlfZGV2ICpwYWRldiA9IHBk
c3YtPnZkcGFfYXV4LT5wYWRldjsKPiArICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwYWRl
di0+YXV4X2Rldi5kZXY7Cj4gKyAgICAgICBzdHJ1Y3QgcGRzX3ZkcGFfc2V0YXR0cl9jbWQgY21k
ID0gewo+ICsgICAgICAgICAgICAgICAub3Bjb2RlID0gUERTX1ZEUEFfQ01EX1NFVF9BVFRSLAo+
ICsgICAgICAgICAgICAgICAudmRwYV9pbmRleCA9IHBkc3YtPnZkcGFfaW5kZXgsCj4gKyAgICAg
ICAgICAgICAgIC52Zl9pZCA9IGNwdV90b19sZTE2KHBkc3YtPnZkcGFfYXV4LT52Zl9pZCksCj4g
KyAgICAgICAgICAgICAgIC5hdHRyID0gUERTX1ZEUEFfQVRUUl9NQVhfVlFfUEFJUlMsCj4gKyAg
ICAgICAgICAgICAgIC5tYXhfdnFfcGFpcnMgPSBjcHVfdG9fbGUxNihtYXhfdnFwKSwKPiArICAg
ICAgIH07Cj4gKyAgICAgICBzdHJ1Y3QgcGRzX3ZkcGFfY29tcCBjb21wID0gezB9Owo+ICsgICAg
ICAgaW50IGVycjsKPiArCj4gKyAgICAgICBlcnIgPSBwYWRldi0+b3BzLT5hZG1pbnFfY21kKHBh
ZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodW5pb24gcGRzX2Nv
cmVfYWRtaW5xX2NtZCAqKSZjbWQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNpemVvZihjbWQpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
dW5pb24gcGRzX2NvcmVfYWRtaW5xX2NvbXAgKikmY29tcCwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMCk7Cj4gKyAgICAgICBpZiAoZXJyKQo+ICsgICAgICAgICAgICAg
ICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBzZXQgbWF4IHZxIHBhaXJzICV1LCBzdGF0dXMgJWQ6
ICVwZVxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICBtYXhfdnFwLCBjb21wLnN0YXR1cywg
RVJSX1BUUihlcnIpKTsKPiArCj4gKyAgICAgICByZXR1cm4gZXJyOwo+ICt9Cj4gKwo+ICtpbnQg
cGRzX3ZkcGFfY21kX2luaXRfdnEoc3RydWN0IHBkc192ZHBhX2RldmljZSAqcGRzdiwgdTE2IHFp
ZCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBkc192ZHBhX3ZxX2luZm8gKnZx
X2luZm8pCj4gK3sKPiArICAgICAgIHN0cnVjdCBwZHNfYXV4aWxpYXJ5X2RldiAqcGFkZXYgPSBw
ZHN2LT52ZHBhX2F1eC0+cGFkZXY7Cj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGFk
ZXYtPmF1eF9kZXYuZGV2Owo+ICsgICAgICAgc3RydWN0IHBkc192ZHBhX3ZxX2luaXRfY29tcCBj
b21wID0gezB9Owo+ICsgICAgICAgc3RydWN0IHBkc192ZHBhX3ZxX2luaXRfY21kIGNtZCA9IHsK
PiArICAgICAgICAgICAgICAgLm9wY29kZSA9IFBEU19WRFBBX0NNRF9WUV9JTklULAo+ICsgICAg
ICAgICAgICAgICAudmRwYV9pbmRleCA9IHBkc3YtPnZkcGFfaW5kZXgsCj4gKyAgICAgICAgICAg
ICAgIC52Zl9pZCA9IGNwdV90b19sZTE2KHBkc3YtPnZkcGFfYXV4LT52Zl9pZCksCj4gKyAgICAg
ICAgICAgICAgIC5xaWQgPSBjcHVfdG9fbGUxNihxaWQpLAo+ICsgICAgICAgICAgICAgICAubGVu
ID0gY3B1X3RvX2xlMTYoaWxvZzIodnFfaW5mby0+cV9sZW4pKSwKPiArICAgICAgICAgICAgICAg
LmRlc2NfYWRkciA9IGNwdV90b19sZTY0KHZxX2luZm8tPmRlc2NfYWRkciksCj4gKyAgICAgICAg
ICAgICAgIC5hdmFpbF9hZGRyID0gY3B1X3RvX2xlNjQodnFfaW5mby0+YXZhaWxfYWRkciksCj4g
KyAgICAgICAgICAgICAgIC51c2VkX2FkZHIgPSBjcHVfdG9fbGU2NCh2cV9pbmZvLT51c2VkX2Fk
ZHIpLAo+ICsgICAgICAgICAgICAgICAuaW50cl9pbmRleCA9IGNwdV90b19sZTE2KHFpZCksCj4g
KyAgICAgICB9Owo+ICsgICAgICAgaW50IGVycjsKPiArCj4gKyAgICAgICBkZXZfZGJnKGRldiwg
IiVzOiBxaWQgJWQgbGVuICVkIGRlc2NfYWRkciAlI2xseCBhdmFpbF9hZGRyICUjbGx4IHVzZWRf
YWRkciAlI2xseFxuIiwKPiArICAgICAgICAgICAgICAgX19mdW5jX18sIHFpZCwgaWxvZzIodnFf
aW5mby0+cV9sZW4pLAo+ICsgICAgICAgICAgICAgICB2cV9pbmZvLT5kZXNjX2FkZHIsIHZxX2lu
Zm8tPmF2YWlsX2FkZHIsIHZxX2luZm8tPnVzZWRfYWRkcik7Cj4gKwo+ICsgICAgICAgZXJyID0g
cGFkZXYtPm9wcy0+YWRtaW5xX2NtZChwYWRldiwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKHVuaW9uIHBkc19jb3JlX2FkbWlucV9jbWQgKikmY21kLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoY21kKSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKHVuaW9uIHBkc19jb3JlX2FkbWlucV9jb21wICopJmNv
bXAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDApOwoKV2UgbWFwIGNv
bW1vbiBjZmcgaW4gcGRzX3ZkcGFfcHJvYmVfdmlydGlvLCBhbnkgcmVhc29uIGZvciB1c2luZwph
ZG1pbnEgaGVyZT8gKEkgZ3Vlc3MgaXQgbWlnaHQgYmUgZmFzdGVyPykKCj4gKyAgICAgICBpZiAo
ZXJyKSB7Cj4gKyAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGluaXQgdnEg
JWQsIHN0YXR1cyAlZDogJXBlXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIHFpZCwgY29t
cC5zdGF0dXMsIEVSUl9QVFIoZXJyKSk7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4g
KyAgICAgICB9Cj4gKwo+ICsgICAgICAgdnFfaW5mby0+aHdfcXR5cGUgPSBjb21wLmh3X3F0eXBl
OwoKV2hhdCBkb2VzIGh3X3F0eXBlIG1lYW4/Cgo+ICsgICAgICAgdnFfaW5mby0+aHdfcWluZGV4
ID0gbGUxNl90b19jcHUoY29tcC5od19xaW5kZXgpOwo+ICsKPiArICAgICAgIHJldHVybiAwOwo+
ICt9Cj4gKwo+ICtpbnQgcGRzX3ZkcGFfY21kX3Jlc2V0X3ZxKHN0cnVjdCBwZHNfdmRwYV9kZXZp
Y2UgKnBkc3YsIHUxNiBxaWQpCj4gK3sKPiArICAgICAgIHN0cnVjdCBwZHNfYXV4aWxpYXJ5X2Rl
diAqcGFkZXYgPSBwZHN2LT52ZHBhX2F1eC0+cGFkZXY7Cj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSAmcGFkZXYtPmF1eF9kZXYuZGV2Owo+ICsgICAgICAgc3RydWN0IHBkc192ZHBhX3Zx
X3Jlc2V0X2NtZCBjbWQgPSB7Cj4gKyAgICAgICAgICAgICAgIC5vcGNvZGUgPSBQRFNfVkRQQV9D
TURfVlFfUkVTRVQsCj4gKyAgICAgICAgICAgICAgIC52ZHBhX2luZGV4ID0gcGRzdi0+dmRwYV9p
bmRleCwKPiArICAgICAgICAgICAgICAgLnZmX2lkID0gY3B1X3RvX2xlMTYocGRzdi0+dmRwYV9h
dXgtPnZmX2lkKSwKPiArICAgICAgICAgICAgICAgLnFpZCA9IGNwdV90b19sZTE2KHFpZCksCj4g
KyAgICAgICB9Owo+ICsgICAgICAgc3RydWN0IHBkc192ZHBhX2NvbXAgY29tcCA9IHswfTsKPiAr
ICAgICAgIGludCBlcnI7Cj4gKwo+ICsgICAgICAgZXJyID0gcGFkZXYtPm9wcy0+YWRtaW5xX2Nt
ZChwYWRldiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuaW9uIHBk
c19jb3JlX2FkbWlucV9jbWQgKikmY21kLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzaXplb2YoY21kKSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKHVuaW9uIHBkc19jb3JlX2FkbWlucV9jb21wICopJmNvbXAsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDApOwo+ICsgICAgICAgaWYgKGVycikKPiArICAgICAgICAg
ICAgICAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gcmVzZXQgdnEgJWQsIHN0YXR1cyAlZDogJXBl
XG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIHFpZCwgY29tcC5zdGF0dXMsIEVSUl9QVFIo
ZXJyKSk7Cj4gKwo+ICsgICAgICAgcmV0dXJuIGVycjsKPiArfQo+ICsKPiAraW50IHBkc192ZHBh
X2NtZF9zZXRfZmVhdHVyZXMoc3RydWN0IHBkc192ZHBhX2RldmljZSAqcGRzdiwgdTY0IGZlYXR1
cmVzKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgcGRzX2F1eGlsaWFyeV9kZXYgKnBhZGV2ID0gcGRz
di0+dmRwYV9hdXgtPnBhZGV2Owo+ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBhZGV2
LT5hdXhfZGV2LmRldjsKPiArICAgICAgIHN0cnVjdCBwZHNfdmRwYV9zZXRfZmVhdHVyZXNfY21k
IGNtZCA9IHsKPiArICAgICAgICAgICAgICAgLm9wY29kZSA9IFBEU19WRFBBX0NNRF9TRVRfRkVB
VFVSRVMsCj4gKyAgICAgICAgICAgICAgIC52ZHBhX2luZGV4ID0gcGRzdi0+dmRwYV9pbmRleCwK
PiArICAgICAgICAgICAgICAgLnZmX2lkID0gY3B1X3RvX2xlMTYocGRzdi0+dmRwYV9hdXgtPnZm
X2lkKSwKPiArICAgICAgICAgICAgICAgLmZlYXR1cmVzID0gY3B1X3RvX2xlNjQoZmVhdHVyZXMp
LAo+ICsgICAgICAgfTsKPiArICAgICAgIHN0cnVjdCBwZHNfdmRwYV9jb21wIGNvbXAgPSB7MH07
Cj4gKyAgICAgICBpbnQgZXJyOwo+ICsKPiArICAgICAgIGVyciA9IHBhZGV2LT5vcHMtPmFkbWlu
cV9jbWQocGFkZXYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1bmlv
biBwZHNfY29yZV9hZG1pbnFfY21kICopJmNtZCwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc2l6ZW9mKGNtZCksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICh1bmlvbiBwZHNfY29yZV9hZG1pbnFfY29tcCAqKSZjb21wLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAwKTsKPiArICAgICAgIGlmIChlcnIpCj4gKyAgICAg
ICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIHNldCBmZWF0dXJlcyAlI2xseCwgc3Rh
dHVzICVkOiAlcGVcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZmVhdHVyZXMsIGNvbXAu
c3RhdHVzLCBFUlJfUFRSKGVycikpOwo+ICsKPiArICAgICAgIHJldHVybiBlcnI7Cj4gK30KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL3Bkcy9jbWRzLmggYi9kcml2ZXJzL3ZkcGEvcGRzL2Nt
ZHMuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi43MmUxOWY0
ZWZkZTYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy92ZHBhL3Bkcy9jbWRzLmgKPiBA
QCAtMCwwICsxLDE2IEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkgKi8KPiArLyogQ29weXJpZ2h0KGMpIDIwMjMgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5j
ICovCj4gKwo+ICsjaWZuZGVmIF9WRFBBX0NNRFNfSF8KPiArI2RlZmluZSBfVkRQQV9DTURTX0hf
Cj4gKwo+ICtpbnQgcGRzX3ZkcGFfaW5pdF9odyhzdHJ1Y3QgcGRzX3ZkcGFfZGV2aWNlICpwZHN2
KTsKPiArCj4gK2ludCBwZHNfdmRwYV9jbWRfcmVzZXQoc3RydWN0IHBkc192ZHBhX2RldmljZSAq
cGRzdik7Cj4gK2ludCBwZHNfdmRwYV9jbWRfc2V0X21hYyhzdHJ1Y3QgcGRzX3ZkcGFfZGV2aWNl
ICpwZHN2LCB1OCAqbWFjKTsKPiAraW50IHBkc192ZHBhX2NtZF9zZXRfbWF4X3ZxX3BhaXJzKHN0
cnVjdCBwZHNfdmRwYV9kZXZpY2UgKnBkc3YsIHUxNiBtYXhfdnFwKTsKPiAraW50IHBkc192ZHBh
X2NtZF9pbml0X3ZxKHN0cnVjdCBwZHNfdmRwYV9kZXZpY2UgKnBkc3YsIHUxNiBxaWQsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwZHNfdmRwYV92cV9pbmZvICp2cV9pbmZvKTsK
PiAraW50IHBkc192ZHBhX2NtZF9yZXNldF92cShzdHJ1Y3QgcGRzX3ZkcGFfZGV2aWNlICpwZHN2
LCB1MTYgcWlkKTsKPiAraW50IHBkc192ZHBhX2NtZF9zZXRfZmVhdHVyZXMoc3RydWN0IHBkc192
ZHBhX2RldmljZSAqcGRzdiwgdTY0IGZlYXR1cmVzKTsKPiArI2VuZGlmIC8qIF9WRFBBX0NNRFNf
SF8gKi8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL3Bkcy92ZHBhX2Rldi5oIGIvZHJpdmVy
cy92ZHBhL3Bkcy92ZHBhX2Rldi5oCj4gaW5kZXggOTdmYWI4MzNhMGFhLi4zMzI4NGViZTUzOGMg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92ZHBhL3Bkcy92ZHBhX2Rldi5oCj4gKysrIGIvZHJpdmVy
cy92ZHBhL3Bkcy92ZHBhX2Rldi5oCj4gQEAgLTQsMTEgKzQsNDUgQEAKPiAgI2lmbmRlZiBfVkRQ
QV9ERVZfSF8KPiAgI2RlZmluZSBfVkRQQV9ERVZfSF8KPgo+IC0jZGVmaW5lIFBEU19WRFBBX01B
WF9RVUVVRVMgICAgNjUKPiArI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgo+ICsjaW5jbHVkZSA8bGlu
dXgvdmRwYS5oPgo+ICsKPiArc3RydWN0IHBkc192ZHBhX3ZxX2luZm8gewo+ICsgICAgICAgYm9v
bCByZWFkeTsKPiArICAgICAgIHU2NCBkZXNjX2FkZHI7Cj4gKyAgICAgICB1NjQgYXZhaWxfYWRk
cjsKPiArICAgICAgIHU2NCB1c2VkX2FkZHI7Cj4gKyAgICAgICB1MzIgcV9sZW47Cj4gKyAgICAg
ICB1MTYgcWlkOwo+ICsgICAgICAgaW50IGlycTsKPiArICAgICAgIGNoYXIgaXJxX25hbWVbMzJd
Owo+ICsKPiArICAgICAgIHZvaWQgX19pb21lbSAqbm90aWZ5Owo+ICsgICAgICAgZG1hX2FkZHJf
dCBub3RpZnlfcGE7Cj4gKwo+ICsgICAgICAgdTY0IGRvb3JiZWxsOwo+ICsgICAgICAgdTE2IGF2
YWlsX2lkeDsKPiArICAgICAgIHUxNiB1c2VkX2lkeDsKPiArCj4gKyAgICAgICB1OCBod19xdHlw
ZTsKPiArICAgICAgIHUxNiBod19xaW5kZXg7Cj4KPiArICAgICAgIHN0cnVjdCB2ZHBhX2NhbGxi
YWNrIGV2ZW50X2NiOwo+ICsgICAgICAgc3RydWN0IHBkc192ZHBhX2RldmljZSAqcGRzdjsKPiAr
fTsKPiArCj4gKyNkZWZpbmUgUERTX1ZEUEFfTUFYX1FVRVVFUyAgICA2NQo+ICsjZGVmaW5lIFBE
U19WRFBBX01BWF9RTEVOICAgICAgMzI3NjgKPiAgc3RydWN0IHBkc192ZHBhX2RldmljZSB7Cj4g
ICAgICAgICBzdHJ1Y3QgdmRwYV9kZXZpY2UgdmRwYV9kZXY7Cj4gICAgICAgICBzdHJ1Y3QgcGRz
X3ZkcGFfYXV4ICp2ZHBhX2F1eDsKPiArCj4gKyAgICAgICBzdHJ1Y3QgcGRzX3ZkcGFfdnFfaW5m
byB2cXNbUERTX1ZEUEFfTUFYX1FVRVVFU107Cj4gKyAgICAgICB1NjQgcmVxX2ZlYXR1cmVzOyAg
ICAgICAgICAgICAgIC8qIGZlYXR1cmVzIHJlcXVlc3RlZCBieSB2ZHBhICovCj4gKyAgICAgICB1
NjQgYWN0dWFsX2ZlYXR1cmVzOyAgICAgICAgICAgIC8qIGZlYXR1cmVzIG5lZ290aWF0ZWQgYW5k
IGluIHVzZSAqLwo+ICsgICAgICAgdTggdmRwYV9pbmRleDsgICAgICAgICAgICAgICAgICAvKiBy
c3ZkIGZvciBmdXR1cmUgc3ViZGV2aWNlIHVzZSAqLwo+ICsgICAgICAgdTggbnVtX3ZxczsgICAg
ICAgICAgICAgICAgICAgICAvKiBudW0gdnFzIGluIHVzZSAqLwo+ICsgICAgICAgc3RydWN0IHZk
cGFfY2FsbGJhY2sgY29uZmlnX2NiOwo+ICB9Owo+Cj4gIGludCBwZHNfdmRwYV9nZXRfbWdtdF9p
bmZvKHN0cnVjdCBwZHNfdmRwYV9hdXggKnZkcGFfYXV4KTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9wZHMvcGRzX3ZkcGEuaCBiL2luY2x1ZGUvbGludXgvcGRzL3Bkc192ZHBhLmgKPiBp
bmRleCAzZjdjMDg1NTExNjMuLmI2YTRjYjRkM2M2YiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L3Bkcy9wZHNfdmRwYS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9wZHMvcGRzX3ZkcGEuaAo+
IEBAIC0xMDEsNCArMTAxLDE3OSBAQCBzdHJ1Y3QgcGRzX3ZkcGFfaWRlbnRfY21kIHsKPiAgICAg
ICAgIF9fbGUzMiBsZW47Cj4gICAgICAgICBfX2xlNjQgaWRlbnRfcGE7Cj4gIH07Cj4gKwo+ICsv
KioKPiArICogc3RydWN0IHBkc192ZHBhX3N0YXR1c19jbWQgLSBTVEFUVVNfVVBEQVRFIGNvbW1h
bmQKPiArICogQG9wY29kZTogICAgT3Bjb2RlIFBEU19WRFBBX0NNRF9TVEFUVVNfVVBEQVRFCj4g
KyAqIEB2ZHBhX2luZGV4OiBJbmRleCBmb3IgdmRwYSBzdWJkZXZpY2UKPiArICogQHZmX2lkOiAg
ICAgVkYgaWQKPiArICogQHN0YXR1czogICAgbmV3IHN0YXR1cyBiaXRzCj4gKyAqLwo+ICtzdHJ1
Y3QgcGRzX3ZkcGFfc3RhdHVzX2NtZCB7Cj4gKyAgICAgICB1OCAgICAgb3Bjb2RlOwo+ICsgICAg
ICAgdTggICAgIHZkcGFfaW5kZXg7Cj4gKyAgICAgICBfX2xlMTYgdmZfaWQ7Cj4gKyAgICAgICB1
OCAgICAgc3RhdHVzOwo+ICt9Owo+ICsKPiArLyoqCj4gKyAqIGVudW0gcGRzX3ZkcGFfYXR0ciAt
IExpc3Qgb2YgVkRQQSBkZXZpY2UgYXR0cmlidXRlcwo+ICsgKiBAUERTX1ZEUEFfQVRUUl9NQUM6
ICAgICAgICAgIE1BQyBhZGRyZXNzCj4gKyAqIEBQRFNfVkRQQV9BVFRSX01BWF9WUV9QQUlSUzog
TWF4IHZpcnRxdWV1ZSBwYWlycwo+ICsgKi8KPiArZW51bSBwZHNfdmRwYV9hdHRyIHsKPiArICAg
ICAgIFBEU19WRFBBX0FUVFJfTUFDICAgICAgICAgID0gMSwKPiArICAgICAgIFBEU19WRFBBX0FU
VFJfTUFYX1ZRX1BBSVJTID0gMiwKPiArfTsKPiArCj4gKy8qKgo+ICsgKiBzdHJ1Y3QgcGRzX3Zk
cGFfc2V0YXR0cl9jbWQgLSBTRVRfQVRUUiBjb21tYW5kCj4gKyAqIEBvcGNvZGU6ICAgICAgICAg
ICAgT3Bjb2RlIFBEU19WRFBBX0NNRF9TRVRfQVRUUgo+ICsgKiBAdmRwYV9pbmRleDogICAgICAg
ICAgICAgICAgSW5kZXggZm9yIHZkcGEgc3ViZGV2aWNlCj4gKyAqIEB2Zl9pZDogICAgICAgICAg
ICAgVkYgaWQKPiArICogQGF0dHI6ICAgICAgICAgICAgICBhdHRyaWJ1dGUgdG8gYmUgY2hhbmdl
ZCAoZW51bSBwZHNfdmRwYV9hdHRyKQo+ICsgKiBAcGFkOiAgICAgICAgICAgICAgIFdvcmQgYm91
bmRhcnkgcGFkZGluZwo+ICsgKiBAbWFjOiAgICAgICAgICAgICAgIG5ldyBtYWMgYWRkcmVzcyB0
byBiZSBhc3NpZ25lZCBhcyB2ZHBhIGRldmljZSBhZGRyZXNzCj4gKyAqIEBtYXhfdnFfcGFpcnM6
ICAgICAgbmV3IGxpbWl0IG9mIHZpcnRxdWV1ZSBwYWlycwo+ICsgKi8KPiArc3RydWN0IHBkc192
ZHBhX3NldGF0dHJfY21kIHsKPiArICAgICAgIHU4ICAgICBvcGNvZGU7Cj4gKyAgICAgICB1OCAg
ICAgdmRwYV9pbmRleDsKPiArICAgICAgIF9fbGUxNiB2Zl9pZDsKPiArICAgICAgIHU4ICAgICBh
dHRyOwo+ICsgICAgICAgdTggICAgIHBhZFszXTsKPiArICAgICAgIHVuaW9uIHsKPiArICAgICAg
ICAgICAgICAgdTggbWFjWzZdOwo+ICsgICAgICAgICAgICAgICBfX2xlMTYgbWF4X3ZxX3BhaXJz
Owo+ICsgICAgICAgfSBfX3BhY2tlZDsKPiArfTsKPiArCj4gKy8qKgo+ICsgKiBzdHJ1Y3QgcGRz
X3ZkcGFfdnFfaW5pdF9jbWQgLSBxdWV1ZSBpbml0IGNvbW1hbmQKPiArICogQG9wY29kZTogT3Bj
b2RlIFBEU19WRFBBX0NNRF9WUV9JTklUCj4gKyAqIEB2ZHBhX2luZGV4OiAgICAgICAgSW5kZXgg
Zm9yIHZkcGEgc3ViZGV2aWNlCj4gKyAqIEB2Zl9pZDogICAgIFZGIGlkCj4gKyAqIEBxaWQ6ICAg
ICAgIFF1ZXVlIGlkIChiaXQwIGNsZWFyID0gcngsIGJpdDAgc2V0ID0gdHgsIHFpZD1OIGlzIGN0
cmxxKQo+ICsgKiBAbGVuOiAgICAgICBsb2coMikgb2YgbWF4IGRlc2NyaXB0b3IgY291bnQKPiAr
ICogQGRlc2NfYWRkcjogRE1BIGFkZHJlc3Mgb2YgZGVzY3JpcHRvciBhcmVhCj4gKyAqIEBhdmFp
bF9hZGRyOiAgICAgICAgRE1BIGFkZHJlc3Mgb2YgYXZhaWxhYmxlIGRlc2NyaXB0b3JzIChha2Eg
ZHJpdmVyIGFyZWEpCj4gKyAqIEB1c2VkX2FkZHI6IERNQSBhZGRyZXNzIG9mIHVzZWQgZGVzY3Jp
cHRvcnMgKGFrYSBkZXZpY2UgYXJlYSkKPiArICogQGludHJfaW5kZXg6ICAgICAgICBpbnRlcnJ1
cHQgaW5kZXgKPiArICovCj4gK3N0cnVjdCBwZHNfdmRwYV92cV9pbml0X2NtZCB7Cj4gKyAgICAg
ICB1OCAgICAgb3Bjb2RlOwo+ICsgICAgICAgdTggICAgIHZkcGFfaW5kZXg7Cj4gKyAgICAgICBf
X2xlMTYgdmZfaWQ7Cj4gKyAgICAgICBfX2xlMTYgcWlkOwo+ICsgICAgICAgX19sZTE2IGxlbjsK
PiArICAgICAgIF9fbGU2NCBkZXNjX2FkZHI7Cj4gKyAgICAgICBfX2xlNjQgYXZhaWxfYWRkcjsK
PiArICAgICAgIF9fbGU2NCB1c2VkX2FkZHI7Cj4gKyAgICAgICBfX2xlMTYgaW50cl9pbmRleDsK
Ckp1c3Qgd29uZGVyIGluIHdoaWNoIGNhc2UgaW50cl9pbmRleCBjYW4gYmUgZGlmZmVyZW50IGZy
b20gcWlkLCBpbgpwZHNfdmRwYV9jbWRfaW5pdF92cSgpIHdlIGhhZDoKCiAgICAgICAgICAgICAg
ICAuaW50cl9pbmRleCA9IGNwdV90b19sZTE2KHFpZCksCgpUaGFua3MKCgo+ICt9Owo+ICsKPiAr
LyoqCj4gKyAqIHN0cnVjdCBwZHNfdmRwYV92cV9pbml0X2NvbXAgLSBxdWV1ZSBpbml0IGNvbXBs
ZXRpb24KPiArICogQHN0YXR1czogICAgU3RhdHVzIG9mIHRoZSBjb21tYW5kIChlbnVtIHBkc19j
b3JlX3N0YXR1c19jb2RlKQo+ICsgKiBAaHdfcXR5cGU6ICBIVyBxdWV1ZSB0eXBlLCB1c2VkIGlu
IGRvb3JiZWxsIHNlbGVjdGlvbgo+ICsgKiBAaHdfcWluZGV4OiBIVyBxdWV1ZSBpbmRleCwgdXNl
ZCBpbiBkb29yYmVsbCBzZWxlY3Rpb24KPiArICogQHJzdmQ6ICAgICAgV29yZCBib3VuZGFyeSBw
YWRkaW5nCj4gKyAqIEBjb2xvcjogICAgIENvbG9yIGJpdAo+ICsgKi8KPiArc3RydWN0IHBkc192
ZHBhX3ZxX2luaXRfY29tcCB7Cj4gKyAgICAgICB1OCAgICAgc3RhdHVzOwo+ICsgICAgICAgdTgg
ICAgIGh3X3F0eXBlOwo+ICsgICAgICAgX19sZTE2IGh3X3FpbmRleDsKPiArICAgICAgIHU4ICAg
ICByc3ZkWzExXTsKPiArICAgICAgIHU4ICAgICBjb2xvcjsKPiArfTsKPiArCj4gKy8qKgo+ICsg
KiBzdHJ1Y3QgcGRzX3ZkcGFfdnFfcmVzZXRfY21kIC0gcXVldWUgcmVzZXQgY29tbWFuZAo+ICsg
KiBAb3Bjb2RlOiAgICBPcGNvZGUgUERTX1ZEUEFfQ01EX1ZRX1JFU0VUCj4gKyAqIEB2ZHBhX2lu
ZGV4OiAgICAgICAgSW5kZXggZm9yIHZkcGEgc3ViZGV2aWNlCj4gKyAqIEB2Zl9pZDogICAgIFZG
IGlkCj4gKyAqIEBxaWQ6ICAgICAgIFF1ZXVlIGlkCj4gKyAqLwo+ICtzdHJ1Y3QgcGRzX3ZkcGFf
dnFfcmVzZXRfY21kIHsKPiArICAgICAgIHU4ICAgICBvcGNvZGU7Cj4gKyAgICAgICB1OCAgICAg
dmRwYV9pbmRleDsKPiArICAgICAgIF9fbGUxNiB2Zl9pZDsKPiArICAgICAgIF9fbGUxNiBxaWQ7
Cj4gK307Cj4gKwo+ICsvKioKPiArICogc3RydWN0IHBkc192ZHBhX3NldF9mZWF0dXJlc19jbWQg
LSBzZXQgaHcgZmVhdHVyZXMKPiArICogQG9wY29kZTogT3Bjb2RlIFBEU19WRFBBX0NNRF9TRVRf
RkVBVFVSRVMKPiArICogQHZkcGFfaW5kZXg6ICAgICAgICBJbmRleCBmb3IgdmRwYSBzdWJkZXZp
Y2UKPiArICogQHZmX2lkOiAgICAgVkYgaWQKPiArICogQHJzdmQ6ICAgICAgIFdvcmQgYm91bmRh
cnkgcGFkZGluZwo+ICsgKiBAZmVhdHVyZXM6ICBGZWF0dXJlIGJpdCBtYXNrCj4gKyAqLwo+ICtz
dHJ1Y3QgcGRzX3ZkcGFfc2V0X2ZlYXR1cmVzX2NtZCB7Cj4gKyAgICAgICB1OCAgICAgb3Bjb2Rl
Owo+ICsgICAgICAgdTggICAgIHZkcGFfaW5kZXg7Cj4gKyAgICAgICBfX2xlMTYgdmZfaWQ7Cj4g
KyAgICAgICBfX2xlMzIgcnN2ZDsKPiArICAgICAgIF9fbGU2NCBmZWF0dXJlczsKPiArfTsKPiAr
Cj4gKy8qKgo+ICsgKiBzdHJ1Y3QgcGRzX3ZkcGFfdnFfc2V0X3N0YXRlX2NtZCAtIHNldCB2cSBz
dGF0ZQo+ICsgKiBAb3Bjb2RlOiAgICBPcGNvZGUgUERTX1ZEUEFfQ01EX1ZRX1NFVF9TVEFURQo+
ICsgKiBAdmRwYV9pbmRleDogICAgICAgIEluZGV4IGZvciB2ZHBhIHN1YmRldmljZQo+ICsgKiBA
dmZfaWQ6ICAgICBWRiBpZAo+ICsgKiBAcWlkOiAgICAgICBRdWV1ZSBpZAo+ICsgKiBAYXZhaWw6
ICAgICBEZXZpY2UgYXZhaWwgaW5kZXguCj4gKyAqIEB1c2VkOiAgICAgIERldmljZSB1c2VkIGlu
ZGV4Lgo+ICsgKgo+ICsgKiBJZiB0aGUgdmlydHF1ZXVlIHVzZXMgcGFja2VkIGRlc2NyaXB0b3Ig
Zm9ybWF0LCB0aGVuIHRoZSBhdmFpbCBhbmQgdXNlZAo+ICsgKiBpbmRleCBtdXN0IGhhdmUgYSB3
cmFwIGNvdW50LiAgVGhlIGJpdHMgc2hvdWxkIGJlIGFycmFuZ2VkIGxpa2UgdGhlIHVwcGVyCj4g
KyAqIDE2IGJpdHMgaW4gdGhlIGRldmljZSBhdmFpbGFibGUgbm90aWZpY2F0aW9uIGRhdGE6IDE1
IGJpdCBpbmRleCwgMSBiaXQgd3JhcC4KPiArICovCj4gK3N0cnVjdCBwZHNfdmRwYV92cV9zZXRf
c3RhdGVfY21kIHsKPiArICAgICAgIHU4ICAgICBvcGNvZGU7Cj4gKyAgICAgICB1OCAgICAgdmRw
YV9pbmRleDsKPiArICAgICAgIF9fbGUxNiB2Zl9pZDsKPiArICAgICAgIF9fbGUxNiBxaWQ7Cj4g
KyAgICAgICBfX2xlMTYgYXZhaWw7Cj4gKyAgICAgICBfX2xlMTYgdXNlZDsKPiArfTsKPiArCj4g
Ky8qKgo+ICsgKiBzdHJ1Y3QgcGRzX3ZkcGFfdnFfZ2V0X3N0YXRlX2NtZCAtIGdldCB2cSBzdGF0
ZQo+ICsgKiBAb3Bjb2RlOiAgICBPcGNvZGUgUERTX1ZEUEFfQ01EX1ZRX0dFVF9TVEFURQo+ICsg
KiBAdmRwYV9pbmRleDogICAgICAgIEluZGV4IGZvciB2ZHBhIHN1YmRldmljZQo+ICsgKiBAdmZf
aWQ6ICAgICBWRiBpZAo+ICsgKiBAcWlkOiAgICAgICBRdWV1ZSBpZAo+ICsgKi8KPiArc3RydWN0
IHBkc192ZHBhX3ZxX2dldF9zdGF0ZV9jbWQgewo+ICsgICAgICAgdTggICAgIG9wY29kZTsKPiAr
ICAgICAgIHU4ICAgICB2ZHBhX2luZGV4Owo+ICsgICAgICAgX19sZTE2IHZmX2lkOwo+ICsgICAg
ICAgX19sZTE2IHFpZDsKPiArfTsKPiArCj4gKy8qKgo+ICsgKiBzdHJ1Y3QgcGRzX3ZkcGFfdnFf
Z2V0X3N0YXRlX2NvbXAgLSBnZXQgdnEgc3RhdGUgY29tcGxldGlvbgo+ICsgKiBAc3RhdHVzOiAg
ICBTdGF0dXMgb2YgdGhlIGNvbW1hbmQgKGVudW0gcGRzX2NvcmVfc3RhdHVzX2NvZGUpCj4gKyAq
IEByc3ZkMDogICAgICBXb3JkIGJvdW5kYXJ5IHBhZGRpbmcKPiArICogQGF2YWlsOiAgICAgRGV2
aWNlIGF2YWlsIGluZGV4Lgo+ICsgKiBAdXNlZDogICAgICBEZXZpY2UgdXNlZCBpbmRleC4KPiAr
ICogQHJzdmQ6ICAgICAgIFdvcmQgYm91bmRhcnkgcGFkZGluZwo+ICsgKiBAY29sb3I6ICAgICBD
b2xvciBiaXQKPiArICoKPiArICogSWYgdGhlIHZpcnRxdWV1ZSB1c2VzIHBhY2tlZCBkZXNjcmlw
dG9yIGZvcm1hdCwgdGhlbiB0aGUgYXZhaWwgYW5kIHVzZWQKPiArICogaW5kZXggd2lsbCBoYXZl
IGEgd3JhcCBjb3VudC4gIFRoZSBiaXRzIHdpbGwgYmUgYXJyYW5nZWQgbGlrZSB0aGUgIm5leHQi
Cj4gKyAqIHBhcnQgb2YgZGV2aWNlIGF2YWlsYWJsZSBub3RpZmljYXRpb24gZGF0YTogMTUgYml0
IGluZGV4LCAxIGJpdCB3cmFwLgo+ICsgKi8KPiArc3RydWN0IHBkc192ZHBhX3ZxX2dldF9zdGF0
ZV9jb21wIHsKPiArICAgICAgIHU4ICAgICBzdGF0dXM7Cj4gKyAgICAgICB1OCAgICAgcnN2ZDA7
Cj4gKyAgICAgICBfX2xlMTYgYXZhaWw7Cj4gKyAgICAgICBfX2xlMTYgdXNlZDsKPiArICAgICAg
IHU4ICAgICByc3ZkWzldOwo+ICsgICAgICAgdTggICAgIGNvbG9yOwo+ICt9Owo+ICsKPiAgI2Vu
ZGlmIC8qIF9QRFNfVkRQQV9JRl9IXyAqLwo+IC0tCj4gMi4xNy4xCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
