Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DC5665254
	for <lists.virtualization@lfdr.de>; Wed, 11 Jan 2023 04:26:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 783DE41937;
	Wed, 11 Jan 2023 03:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 783DE41937
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igel-co-jp.20210112.gappssmtp.com header.i=@igel-co-jp.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=izrilxH9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4aKnfpbHb-Be; Wed, 11 Jan 2023 03:26:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A90C94193C;
	Wed, 11 Jan 2023 03:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A90C94193C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE82EC0078;
	Wed, 11 Jan 2023 03:26:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C7B9C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Jan 2023 03:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EF0860B2B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Jan 2023 03:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EF0860B2B
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igel-co-jp.20210112.gappssmtp.com
 header.i=@igel-co-jp.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=izrilxH9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yY0h-9SU7i-g
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Jan 2023 03:26:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7EF960B25
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7EF960B25
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Jan 2023 03:26:43 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id e10so9631799pgc.9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Jan 2023 19:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=alncDRdItzGVC9H0nB2eZTIUdgfc1NKFCap3fed5pds=;
 b=izrilxH9gs69Tz2WgBhBHAOEXPd+T4IF7O/CMa7SyYp2QGRWxPzhxVkJ+wfJMx00MD
 tvv036Af6sjwa+nP5DEZ6RqOob4aQpgI8fq+CnV2StFy9fDUcc9cmvGlU2lilVhRng6/
 Ft+V58ocfNByYVhXN6O1/8YKqLLOD+rvPA9HZWo8RWDNt+5QQ4AdYg+TokKoQt8IBTNz
 +KbvRdpjnbXkDE7SaIT2906Xlo1FVl9QCwQAV09+o4N7kU0Pjn8SbMiZ08lRekNTQdW+
 se8YF6It/blHmhdh/2cg+FcGFzWIZ6Y6fHufzonT76GlZSoZ9eWqqiz4dHRw+viitZla
 yBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=alncDRdItzGVC9H0nB2eZTIUdgfc1NKFCap3fed5pds=;
 b=DWb2zfoCK004IHAri9d8Ry2MBIVZ3mHKQfZLAhhccEAfJDurUuVClak5Adpr5tYbNT
 IEpdGsAIZO/psWqZpOEy25rfjIDvMhCm7IeNA3xveEBO91ZIF7VtekjzpxM+5AyhP79z
 TsXaGyyA4TIIZWyQuqC4zlBZuYcPPmSheSW4g/1QPE73HL8opbHJMZph7DcYOgCV/wQZ
 Z7zNFWAd/3zY9gn5qlkXAMkLTwRnmEh5TAABAiFIiKH08zqcwGdnhTEzicdNXwECswXv
 YjGikrlUALj22FBi2dJVvEQrdLlMikgKyUxxaYTUGwe20kitwU0a6F/V1Xoq/v0Zkm5V
 nsCg==
X-Gm-Message-State: AFqh2kraG2exoFAPHJnmpxMQ7u+xTuoX1FBQnJqyhERWZL9fdsi+QUT8
 3spmIvO9ySq0PhJ8yz5npxdrww==
X-Google-Smtp-Source: AMrXdXtPEgDn7RC/sWl6ItzRrxeRyhA6Zhw0n5qUmtAeOTEJJiIJPYEoz6/9OW7xMf2mBV7popeSOw==
X-Received: by 2002:a05:6a00:1813:b0:582:a492:f302 with SMTP id
 y19-20020a056a00181300b00582a492f302mr34855118pfa.16.1673407603186; 
 Tue, 10 Jan 2023 19:26:43 -0800 (PST)
Received: from [10.16.128.218] (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 t2-20020aa79462000000b00582a224e738sm8820334pfq.63.2023.01.10.19.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 19:26:42 -0800 (PST)
Message-ID: <18a0a7cd-0601-0ff6-12d7-353819692155@igel.co.jp>
Date: Wed, 11 Jan 2023 12:26:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 2/9] vringh: remove vringh_iov and unite to vringh_kiov
To: Jason Wang <jasowang@redhat.com>
References: <20221227022528.609839-1-mie@igel.co.jp>
 <20221227022528.609839-3-mie@igel.co.jp>
 <CACGkMEtAaYpuZtS0gx_m931nFzcvqSNK9BhvUZH_tZXTzjgQCg@mail.gmail.com>
 <CANXvt5rfXDYa0nLzKW5-Q-hjhw-19npXVneqBO1TcsariU6rWg@mail.gmail.com>
 <CACGkMEvmZ5MEX4WMa3JhzT404C2uhsNk0nnkYBRtvLPhNTSzHQ@mail.gmail.com>
Content-Language: en-US
From: Shunsuke Mie <mie@igel.co.jp>
In-Reply-To: <CACGkMEvmZ5MEX4WMa3JhzT404C2uhsNk0nnkYBRtvLPhNTSzHQ@mail.gmail.com>
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjIvMTIvMjggMTU6MzYsIEphc29uIFdhbmcgd3JvdGU6Cj4gT24gVHVlLCBEZWMgMjcs
IDIwMjIgYXQgMzowNiBQTSBTaHVuc3VrZSBNaWUgPG1pZUBpZ2VsLmNvLmpwPiB3cm90ZToKPj4g
MjAyMuW5tDEy5pyIMjfml6Uo54GrKSAxNTowNCBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQu
Y29tPjoKPj4+IE9uIFR1ZSwgRGVjIDI3LCAyMDIyIGF0IDEwOjI1IEFNIFNodW5zdWtlIE1pZSA8
bWllQGlnZWwuY28uanA+IHdyb3RlOgo+Pj4+IHN0cnVjdCB2cmluZ2hfaW92IGlzIGRlZmluZWQg
dG8gaG9sZCB1c2VybGFuZCBhZGRyZXNzZXMuIEhvd2V2ZXIsIHRvIHVzZQo+Pj4+IGNvbW1vbiBm
dW5jdGlvbiwgX192cmluZ19pb3YsIGZpbmFsbHkgdGhlIHZyaW5naF9pb3YgY29udmVydHMgdG8g
dGhlCj4+Pj4gdnJpbmdoX2tpb3Ygd2l0aCBzaW1wbGUgY2FzdC4gSXQgaW5jbHVkZXMgY29tcGls
ZSB0aW1lIGNoZWNrIGNvZGUgdG8gbWFrZQo+Pj4+IHN1cmUgaXQgY2FuIGJlIGNhc3QgY29ycmVj
dGx5Lgo+Pj4+Cj4+Pj4gVG8gc2ltcGxpZnkgdGhlIGNvZGUsIHRoaXMgcGF0Y2ggcmVtb3ZlcyB0
aGUgc3RydWN0IHZyaW5naF9pb3YgYW5kIHVuaWZpZXMKPj4+PiBBUElzIHRvIHN0cnVjdCB2cmlu
Z2hfa2lvdi4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFNodW5zdWtlIE1pZSA8bWllQGlnZWwu
Y28uanA+Cj4+PiBXaGlsZSBhdCB0aGlzLCBJIHdvbmRlciBpZiB3ZSBuZWVkIHRvIGdvIGZ1cnRo
ZXIsIHRoYXQgaXMsIHN3aXRjaCB0bwo+Pj4gdXNpbmcgYW4gaW92IGl0ZXJhdG9yIGluc3RlYWQg
b2YgYSB2cmluZ2ggY3VzdG9taXplZCBvbmUuCj4+IEkgZGlkbid0IHNlZSB0aGUgaW92IGl0ZXJh
dG9yIHlldCwgdGhhbmsgeW91IGZvciBpbmZvcm1pbmcgbWUuCj4+IElzIHRoYXQgaW92X2l0ZXI/
IGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy82MjUwNzcvCj4gRXhhY3RseS4KCkkndmUgaW52ZXN0
aWdhdGVkIHRoZSBpb3ZfaXRlciwgdmhvc3QgYW5kIHJlbGF0ZWQgQVBJcy4gQXMgYSByZXN1bHQs
IEkKdGhpbmsgdGhhdCBpdCBpcyBub3QgZWFzeSB0byBzd2l0Y2ggdG8gdXNlIHRoZSBpb3ZfaXRl
ci4gQmVjYXVzZSwgdGhlCmRlc2lnbiBvZiB2aG9zdCBhbmQgdnJpbmdoIGlzIGRpZmZlcmVudC4K
ClRoZSBpb3ZfaXRlciBoYXMgdnJpbmcgZGVzYyBpbmZvIGFuZCBtZXRhIGRhdGEgb2YgdHJhbnNm
ZXIgbWV0aG9kLiBUaGUKdmhvc3QgcHJvdmlkZXMgZ2VuZXJpYyB0cmFuc2ZlciBmdW5jdGlvbiBm
b3IgdGhlIGlvdl9pdGVyLiBJbiBjb25zdHJhc3QsCnZyaW5naF9pb3YganVzdCBoYXMgdnJpbmcg
ZGVzYyBpbmZvLiBUaGUgdnJpbmdoIHByb3ZpZGVzIHRyYW5zZmVyIGZ1bmN0aW9ucwpmb3IgZWFj
aCBtZXRob2RzLgoKSW4gdGhlIGZ1dHVyZSwgaXQgaXMgYmV0dGVyIHRvIHVzZSBjb21tb24gZGF0
YSBzdHJ1Y3R1cmUgYW5kIEFQSXMgYmV0d2Vlbgp2aG9zdCBhbmQgdnJpbmdoIChvciBtZXJnZSBj
b21wbGV0ZWx5KSwgYnV0IGl0IHJlcXVpcmVzIGEgbG90IG9mIApjaGFuZ2VzLCBzbyBJJ2QgbGlr
ZSB0byBqdXN0Cm9yZ2FuaXplIGRhdGEgc3RydWN0dXJlIGluIHZyaW5naCBhcyBhIGZpcnN0IHN0
ZXAgaW4gdGhpcyBwYXRjaC4KCgpCZXN0Cgo+IFRoYW5rcwo+Cj4+PiBUaGFua3MKPj4+Cj4+Pj4g
LS0tCj4+Pj4gICBkcml2ZXJzL3Zob3N0L3ZyaW5naC5jIHwgMzIgKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4+Pj4gICBpbmNsdWRlL2xpbnV4L3ZyaW5naC5oIHwgNDUgKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4gICAyIGZpbGVzIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDY3IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdmhvc3QvdnJpbmdoLmMgYi9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jCj4+Pj4gaW5k
ZXggODI4YzI5MzA2NTY1Li5hYTNjZDI3ZDIzODQgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy92
aG9zdC92cmluZ2guYwo+Pj4+ICsrKyBiL2RyaXZlcnMvdmhvc3QvdnJpbmdoLmMKPj4+PiBAQCAt
NjkxLDggKzY5MSw4IEBAIEVYUE9SVF9TWU1CT0wodnJpbmdoX2luaXRfdXNlcik7Cj4+Pj4gICAg
KiBjYWxsaW5nIHZyaW5naF9pb3ZfY2xlYW51cCgpIHRvIHJlbGVhc2UgdGhlIG1lbW9yeSwgZXZl
biBvbiBlcnJvciEKPj4+PiAgICAqLwo+Pj4+ICAgaW50IHZyaW5naF9nZXRkZXNjX3VzZXIoc3Ry
dWN0IHZyaW5naCAqdnJoLAo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2cmlu
Z2hfaW92ICpyaW92LAo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2cmluZ2hf
aW92ICp3aW92LAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2cmluZ2hfa2lv
diAqcmlvdiwKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdnJpbmdoX2tpb3Yg
Kndpb3YsCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgKCpnZXRyYW5nZSkoc3Ry
dWN0IHZyaW5naCAqdnJoLAo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHU2NCBhZGRyLCBzdHJ1Y3QgdnJpbmdoX3JhbmdlICpyKSwKPj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgdTE2ICpoZWFkKQo+Pj4+IEBAIC03MDgsMjYgKzcwOCw2IEBAIGludCB2
cmluZ2hfZ2V0ZGVzY191c2VyKHN0cnVjdCB2cmluZ2ggKnZyaCwKPj4+PiAgICAgICAgICBpZiAo
ZXJyID09IHZyaC0+dnJpbmcubnVtKQo+Pj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4+
Pj4KPj4+PiAtICAgICAgIC8qIFdlIG5lZWQgdGhlIGxheW91dHMgdG8gYmUgdGhlIGlkZW50aWNh
bCBmb3IgdGhpcyB0byB3b3JrICovCj4+Pj4gLSAgICAgICBCVUlMRF9CVUdfT04oc2l6ZW9mKHN0
cnVjdCB2cmluZ2hfa2lvdikgIT0gc2l6ZW9mKHN0cnVjdCB2cmluZ2hfaW92KSk7Cj4+Pj4gLSAg
ICAgICBCVUlMRF9CVUdfT04ob2Zmc2V0b2Yoc3RydWN0IHZyaW5naF9raW92LCBpb3YpICE9Cj4+
Pj4gLSAgICAgICAgICAgICAgICAgICAgb2Zmc2V0b2Yoc3RydWN0IHZyaW5naF9pb3YsIGlvdikp
Owo+Pj4+IC0gICAgICAgQlVJTERfQlVHX09OKG9mZnNldG9mKHN0cnVjdCB2cmluZ2hfa2lvdiwg
aSkgIT0KPj4+PiAtICAgICAgICAgICAgICAgICAgICBvZmZzZXRvZihzdHJ1Y3QgdnJpbmdoX2lv
diwgaSkpOwo+Pj4+IC0gICAgICAgQlVJTERfQlVHX09OKG9mZnNldG9mKHN0cnVjdCB2cmluZ2hf
a2lvdiwgdXNlZCkgIT0KPj4+PiAtICAgICAgICAgICAgICAgICAgICBvZmZzZXRvZihzdHJ1Y3Qg
dnJpbmdoX2lvdiwgdXNlZCkpOwo+Pj4+IC0gICAgICAgQlVJTERfQlVHX09OKG9mZnNldG9mKHN0
cnVjdCB2cmluZ2hfa2lvdiwgbWF4X251bSkgIT0KPj4+PiAtICAgICAgICAgICAgICAgICAgICBv
ZmZzZXRvZihzdHJ1Y3QgdnJpbmdoX2lvdiwgbWF4X251bSkpOwo+Pj4+IC0gICAgICAgQlVJTERf
QlVHX09OKHNpemVvZihzdHJ1Y3QgaW92ZWMpICE9IHNpemVvZihzdHJ1Y3Qga3ZlYykpOwo+Pj4+
IC0gICAgICAgQlVJTERfQlVHX09OKG9mZnNldG9mKHN0cnVjdCBpb3ZlYywgaW92X2Jhc2UpICE9
Cj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgb2Zmc2V0b2Yoc3RydWN0IGt2ZWMsIGlvdl9iYXNl
KSk7Cj4+Pj4gLSAgICAgICBCVUlMRF9CVUdfT04ob2Zmc2V0b2Yoc3RydWN0IGlvdmVjLCBpb3Zf
bGVuKSAhPQo+Pj4+IC0gICAgICAgICAgICAgICAgICAgIG9mZnNldG9mKHN0cnVjdCBrdmVjLCBp
b3ZfbGVuKSk7Cj4+Pj4gLSAgICAgICBCVUlMRF9CVUdfT04oc2l6ZW9mKCgoc3RydWN0IGlvdmVj
ICopTlVMTCktPmlvdl9iYXNlKQo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICE9IHNpemVvZigo
KHN0cnVjdCBrdmVjICopTlVMTCktPmlvdl9iYXNlKSk7Cj4+Pj4gLSAgICAgICBCVUlMRF9CVUdf
T04oc2l6ZW9mKCgoc3RydWN0IGlvdmVjICopTlVMTCktPmlvdl9sZW4pCj4+Pj4gLSAgICAgICAg
ICAgICAgICAgICAgIT0gc2l6ZW9mKCgoc3RydWN0IGt2ZWMgKilOVUxMKS0+aW92X2xlbikpOwo+
Pj4+IC0KPj4+PiAgICAgICAgICAqaGVhZCA9IGVycjsKPj4+PiAgICAgICAgICBlcnIgPSBfX3Zy
aW5naF9pb3YodnJoLCAqaGVhZCwgKHN0cnVjdCB2cmluZ2hfa2lvdiAqKXJpb3YsCj4+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIChzdHJ1Y3QgdnJpbmdoX2tpb3YgKil3aW92LAo+Pj4+
IEBAIC03NDAsMTQgKzcyMCwxNCBAQCBpbnQgdnJpbmdoX2dldGRlc2NfdXNlcihzdHJ1Y3QgdnJp
bmdoICp2cmgsCj4+Pj4gICBFWFBPUlRfU1lNQk9MKHZyaW5naF9nZXRkZXNjX3VzZXIpOwo+Pj4+
Cj4+Pj4gICAvKioKPj4+PiAtICogdnJpbmdoX2lvdl9wdWxsX3VzZXIgLSBjb3B5IGJ5dGVzIGZy
b20gdnJpbmdfaW92Lgo+Pj4+ICsgKiB2cmluZ2hfaW92X3B1bGxfdXNlciAtIGNvcHkgYnl0ZXMg
ZnJvbSB2cmluZ19raW92Lgo+Pj4+ICAgICogQHJpb3Y6IHRoZSByaW92IGFzIHBhc3NlZCB0byB2
cmluZ2hfZ2V0ZGVzY191c2VyKCkgKHVwZGF0ZWQgYXMgd2UgY29uc3VtZSkKPj4+PiAgICAqIEBk
c3Q6IHRoZSBwbGFjZSB0byBjb3B5Lgo+Pj4+ICAgICogQGxlbjogdGhlIG1heGltdW0gbGVuZ3Ro
IHRvIGNvcHkuCj4+Pj4gICAgKgo+Pj4+ICAgICogUmV0dXJucyB0aGUgYnl0ZXMgY29waWVkIDw9
IGxlbiBvciBhIG5lZ2F0aXZlIGVycm5vLgo+Pj4+ICAgICovCj4+Pj4gLXNzaXplX3QgdnJpbmdo
X2lvdl9wdWxsX3VzZXIoc3RydWN0IHZyaW5naF9pb3YgKnJpb3YsIHZvaWQgKmRzdCwgc2l6ZV90
IGxlbikKPj4+PiArc3NpemVfdCB2cmluZ2hfaW92X3B1bGxfdXNlcihzdHJ1Y3QgdnJpbmdoX2tp
b3YgKnJpb3YsIHZvaWQgKmRzdCwgc2l6ZV90IGxlbikKPj4+PiAgIHsKPj4+PiAgICAgICAgICBy
ZXR1cm4gdnJpbmdoX2lvdl94ZmVyKE5VTEwsIChzdHJ1Y3QgdnJpbmdoX2tpb3YgKilyaW92LAo+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZHN0LCBsZW4sIHhmZXJfZnJvbV91
c2VyKTsKPj4+PiBAQCAtNzU1LDE0ICs3MzUsMTQgQEAgc3NpemVfdCB2cmluZ2hfaW92X3B1bGxf
dXNlcihzdHJ1Y3QgdnJpbmdoX2lvdiAqcmlvdiwgdm9pZCAqZHN0LCBzaXplX3QgbGVuKQo+Pj4+
ICAgRVhQT1JUX1NZTUJPTCh2cmluZ2hfaW92X3B1bGxfdXNlcik7Cj4+Pj4KPj4+PiAgIC8qKgo+
Pj4+IC0gKiB2cmluZ2hfaW92X3B1c2hfdXNlciAtIGNvcHkgYnl0ZXMgaW50byB2cmluZ19pb3Yu
Cj4+Pj4gKyAqIHZyaW5naF9pb3ZfcHVzaF91c2VyIC0gY29weSBieXRlcyBpbnRvIHZyaW5nX2tp
b3YuCj4+Pj4gICAgKiBAd2lvdjogdGhlIHdpb3YgYXMgcGFzc2VkIHRvIHZyaW5naF9nZXRkZXNj
X3VzZXIoKSAodXBkYXRlZCBhcyB3ZSBjb25zdW1lKQo+Pj4+ICAgICogQHNyYzogdGhlIHBsYWNl
IHRvIGNvcHkgZnJvbS4KPj4+PiAgICAqIEBsZW46IHRoZSBtYXhpbXVtIGxlbmd0aCB0byBjb3B5
Lgo+Pj4+ICAgICoKPj4+PiAgICAqIFJldHVybnMgdGhlIGJ5dGVzIGNvcGllZCA8PSBsZW4gb3Ig
YSBuZWdhdGl2ZSBlcnJuby4KPj4+PiAgICAqLwo+Pj4+IC1zc2l6ZV90IHZyaW5naF9pb3ZfcHVz
aF91c2VyKHN0cnVjdCB2cmluZ2hfaW92ICp3aW92LAo+Pj4+ICtzc2l6ZV90IHZyaW5naF9pb3Zf
cHVzaF91c2VyKHN0cnVjdCB2cmluZ2hfa2lvdiAqd2lvdiwKPj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCB2b2lkICpzcmMsIHNpemVfdCBsZW4pCj4+Pj4gICB7Cj4+Pj4g
ICAgICAgICAgcmV0dXJuIHZyaW5naF9pb3ZfeGZlcihOVUxMLCAoc3RydWN0IHZyaW5naF9raW92
ICopd2lvdiwKPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92cmluZ2guaCBiL2luY2x1
ZGUvbGludXgvdnJpbmdoLmgKPj4+PiBpbmRleCAxOTkxYTAyYzY0MzEuLjczM2Q5NDhlODEyMyAx
MDA2NDQKPj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3ZyaW5naC5oCj4+Pj4gKysrIGIvaW5jbHVk
ZS9saW51eC92cmluZ2guaAo+Pj4+IEBAIC03OSwxOCArNzksNiBAQCBzdHJ1Y3QgdnJpbmdoX3Jh
bmdlIHsKPj4+PiAgICAgICAgICB1NjQgb2Zmc2V0Owo+Pj4+ICAgfTsKPj4+Pgo+Pj4+IC0vKioK
Pj4+PiAtICogc3RydWN0IHZyaW5naF9pb3YgLSBpb3ZlYyBtYW5nbGVyLgo+Pj4+IC0gKgo+Pj4+
IC0gKiBNYW5nbGVzIGlvdmVjIGluIHBsYWNlLCBhbmQgcmVzdG9yZXMgaXQuCj4+Pj4gLSAqIFJl
bWFpbmluZyBkYXRhIGlzIGlvdiArIGksIG9mIHVzZWQgLSBpIGVsZW1lbnRzLgo+Pj4+IC0gKi8K
Pj4+PiAtc3RydWN0IHZyaW5naF9pb3Ygewo+Pj4+IC0gICAgICAgc3RydWN0IGlvdmVjICppb3Y7
Cj4+Pj4gLSAgICAgICBzaXplX3QgY29uc3VtZWQ7IC8qIFdpdGhpbiBpb3ZbaV0gKi8KPj4+PiAt
ICAgICAgIHVuc2lnbmVkIGksIHVzZWQsIG1heF9udW07Cj4+Pj4gLX07Cj4+Pj4gLQo+Pj4+ICAg
LyoqCj4+Pj4gICAgKiBzdHJ1Y3QgdnJpbmdoX2tpb3YgLSBrdmVjIG1hbmdsZXIuCj4+Pj4gICAg
Kgo+Pj4+IEBAIC0xMTMsNDQgKzEwMSwxOSBAQCBpbnQgdnJpbmdoX2luaXRfdXNlcihzdHJ1Y3Qg
dnJpbmdoICp2cmgsIHU2NCBmZWF0dXJlcywKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgdnJp
bmdfYXZhaWxfdCBfX3VzZXIgKmF2YWlsLAo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICB2cmlu
Z191c2VkX3QgX191c2VyICp1c2VkKTsKPj4+Pgo+Pj4+IC1zdGF0aWMgaW5saW5lIHZvaWQgdnJp
bmdoX2lvdl9pbml0KHN0cnVjdCB2cmluZ2hfaW92ICppb3YsCj4+Pj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaW92ZWMgKmlvdmVjLCB1bnNpZ25lZCBudW0pCj4+
Pj4gLXsKPj4+PiAtICAgICAgIGlvdi0+dXNlZCA9IGlvdi0+aSA9IDA7Cj4+Pj4gLSAgICAgICBp
b3YtPmNvbnN1bWVkID0gMDsKPj4+PiAtICAgICAgIGlvdi0+bWF4X251bSA9IG51bTsKPj4+PiAt
ICAgICAgIGlvdi0+aW92ID0gaW92ZWM7Cj4+Pj4gLX0KPj4+PiAtCj4+Pj4gLXN0YXRpYyBpbmxp
bmUgdm9pZCB2cmluZ2hfaW92X3Jlc2V0KHN0cnVjdCB2cmluZ2hfaW92ICppb3YpCj4+Pj4gLXsK
Pj4+PiAtICAgICAgIGlvdi0+aW92W2lvdi0+aV0uaW92X2xlbiArPSBpb3YtPmNvbnN1bWVkOwo+
Pj4+IC0gICAgICAgaW92LT5pb3ZbaW92LT5pXS5pb3ZfYmFzZSAtPSBpb3YtPmNvbnN1bWVkOwo+
Pj4+IC0gICAgICAgaW92LT5jb25zdW1lZCA9IDA7Cj4+Pj4gLSAgICAgICBpb3YtPmkgPSAwOwo+
Pj4+IC19Cj4+Pj4gLQo+Pj4+IC1zdGF0aWMgaW5saW5lIHZvaWQgdnJpbmdoX2lvdl9jbGVhbnVw
KHN0cnVjdCB2cmluZ2hfaW92ICppb3YpCj4+Pj4gLXsKPj4+PiAtICAgICAgIGlmIChpb3YtPm1h
eF9udW0gJiBWUklOR0hfSU9WX0FMTE9DQVRFRCkKPj4+PiAtICAgICAgICAgICAgICAga2ZyZWUo
aW92LT5pb3YpOwo+Pj4+IC0gICAgICAgaW92LT5tYXhfbnVtID0gaW92LT51c2VkID0gaW92LT5p
ID0gaW92LT5jb25zdW1lZCA9IDA7Cj4+Pj4gLSAgICAgICBpb3YtPmlvdiA9IE5VTEw7Cj4+Pj4g
LX0KPj4+PiAtCj4+Pj4gICAvKiBDb252ZXJ0IGEgZGVzY3JpcHRvciBpbnRvIGlvdmVjcy4gKi8K
Pj4+PiAgIGludCB2cmluZ2hfZ2V0ZGVzY191c2VyKHN0cnVjdCB2cmluZ2ggKnZyaCwKPj4+PiAt
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdnJpbmdoX2lvdiAqcmlvdiwKPj4+PiAtICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdnJpbmdoX2lvdiAqd2lvdiwKPj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgdnJpbmdoX2tpb3YgKnJpb3YsCj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IHZyaW5naF9raW92ICp3aW92LAo+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICBib29sICgqZ2V0cmFuZ2UpKHN0cnVjdCB2cmluZ2ggKnZyaCwKPj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1NjQgYWRkciwgc3RydWN0
IHZyaW5naF9yYW5nZSAqciksCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIHUxNiAqaGVh
ZCk7Cj4+Pj4KPj4+PiAgIC8qIENvcHkgYnl0ZXMgZnJvbSByZWFkYWJsZSB2c2csIGNvbnN1bWlu
ZyBpdCAoYW5kIGluY3JlbWVudGluZyB3aW92LT5pKS4gKi8KPj4+PiAtc3NpemVfdCB2cmluZ2hf
aW92X3B1bGxfdXNlcihzdHJ1Y3QgdnJpbmdoX2lvdiAqcmlvdiwgdm9pZCAqZHN0LCBzaXplX3Qg
bGVuKTsKPj4+PiArc3NpemVfdCB2cmluZ2hfaW92X3B1bGxfdXNlcihzdHJ1Y3QgdnJpbmdoX2tp
b3YgKnJpb3YsIHZvaWQgKmRzdCwgc2l6ZV90IGxlbik7Cj4+Pj4KPj4+PiAgIC8qIENvcHkgYnl0
ZXMgaW50byB3cml0YWJsZSB2c2csIGNvbnN1bWluZyBpdCAoYW5kIGluY3JlbWVudGluZyB3aW92
LT5pKS4gKi8KPj4+PiAtc3NpemVfdCB2cmluZ2hfaW92X3B1c2hfdXNlcihzdHJ1Y3QgdnJpbmdo
X2lvdiAqd2lvdiwKPj4+PiArc3NpemVfdCB2cmluZ2hfaW92X3B1c2hfdXNlcihzdHJ1Y3QgdnJp
bmdoX2tpb3YgKndpb3YsCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
dm9pZCAqc3JjLCBzaXplX3QgbGVuKTsKPj4+Pgo+Pj4+ICAgLyogTWFyayBhIGRlc2NyaXB0b3Ig
YXMgdXNlZC4gKi8KPj4+PiAtLQo+Pj4+IDIuMjUuMQo+Pj4+Cj4+IEJlc3QsCj4+IFNodW5zdWtl
Cj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
