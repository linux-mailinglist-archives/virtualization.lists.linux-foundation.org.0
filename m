Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A156E49034A
	for <lists.virtualization@lfdr.de>; Mon, 17 Jan 2022 08:59:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A7D74033D;
	Mon, 17 Jan 2022 07:59:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nokwZcoZZw1n; Mon, 17 Jan 2022 07:59:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 948CE402A0;
	Mon, 17 Jan 2022 07:59:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F311EC007A;
	Mon, 17 Jan 2022 07:59:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A4B0C002F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jan 2022 07:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEA688144E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jan 2022 07:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=daynix-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bKvPEZi5KVOk
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jan 2022 07:58:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C9F08144C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Jan 2022 07:58:58 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id bf5so151677oib.4
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Jan 2022 23:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n90Yt0bjmJUFoRDJKyJmGtSaOSP7/z10vdpKeraltf8=;
 b=6y5M0I85tqIm5DVUelB3EwLInUnEOxRxAfwa8l8yHfBomdjgKEfd4L1oArQYHso+qY
 TQimD3GlKoql6MZQcEMU28C3jYTjdBW6HzNDt4K4EsyxyXb4noKnI+2HLu+2mOO2DGIN
 JtAt1L1W9il9QZZb0vQJ4APi59OBsSltaa/TcGUPeFti69kGTgxcAzGFRob0G6FkAbtB
 XwWT24dxTwPIsYzMQIk9rXEuspPO/XjzdETfyn53y/dsSFN6gnFaJ0+AFZszDnf8m+YV
 FSbzCeo3CKoY8a67d15SPgEjb5CGk57O7BCs3Gy7+7+JAh7E3ESGmG7iicFLvckVHZbR
 vPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n90Yt0bjmJUFoRDJKyJmGtSaOSP7/z10vdpKeraltf8=;
 b=hC3IROSJiPD/w5djKc1RDaCv4CaRVqF4HGOlxaH5HanPCXbyL+9ZlP4Ap0U2bqRSh8
 AqWncdiJqGhRLcLPVDdZV/jFYtaokzbEMmeUHYZx2Yjqd9dMnScTpi/SLlpYN984tWpI
 2gG29D5AukwUiLLdhp9/Y8LFdSOsK2pvCPS0D5a6rRKRFivm2F+8vNL3SvHyJazW9RJO
 n/C/ib59ZHoLNhQOzwLcylpk6m0HOlwSdiRA4LSkHi4uLTGgKG2PDsIJjBzE98yQphy/
 WVqkrFZV2T6LO/5gb48eXap1BAC77wioLHVPpQCxW4lG0X4I5eVgOjGjFrTTr0ir0Ana
 fRZA==
X-Gm-Message-State: AOAM533pkslwoE254lcrmaMLv+kQxi8Etf7rQC0o0ConGPFY8X69e+mB
 mDWp7ySrSB+PVDvmOnzQqHLP1nJnF9iHkcYqD+v9ew==
X-Google-Smtp-Source: ABdhPJzYuRez50xbjcGtoJOCYG+BqgeEKDAeBhnZQUeQZVhplPtXnBN66e3oDjlrIcZ1wrYimG3o0zBLI4EkvI9iheo=
X-Received: by 2002:a05:6808:1206:: with SMTP id
 a6mr16516174oil.94.1642406338084; 
 Sun, 16 Jan 2022 23:58:58 -0800 (PST)
MIME-Version: 1.0
References: <20220109210659.2866740-1-andrew@daynix.com>
 <20220109210659.2866740-5-andrew@daynix.com>
 <e92eba5b-1fd6-0b58-6fb5-2e322fdad3ef@redhat.com>
In-Reply-To: <e92eba5b-1fd6-0b58-6fb5-2e322fdad3ef@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Mon, 17 Jan 2022 09:58:47 +0200
Message-ID: <CABcq3pFOL9u9rdwjyERzf06314MU9q3P0dFkQGzX2XxJv_Fe7w@mail.gmail.com>
Subject: Re: [PATCH 4/4] drivers/net/virtio_net: Added RSS hash report control.
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, kuba@kernel.org, davem@davemloft.net
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

SGkgYWxsLAoKPiBlLmcgUlhIX1ZMQU4gd2l0aCBwb3J0IGhhc2g/Cj4gQW55IHdheSB0byBtZXJn
ZSB0aGUgdHdvIHN3aXRjaD8gVGhlIGNvZGUgaXMgaGFyZCB0byBiZSByZXZpZXdlZCBhbnlob3cu
CkknbGwgcmVmYWN0b3IgdmlydG5ldF9zZXRfaGFzaGZsb3cuCgo+IEkgdGhpbmsgaXQncyBiZXR0
ZXIgdG8gdXNlIFZJUlRJT19ORVRfSEFTSF9SRVBPUlRfTk9ORSBoZXJlLgpZZXMsIEknbGwgZml4
IHRoYXQuCgpPbiBUdWUsIEphbiAxMSwgMjAyMiBhdCA2OjMzIEFNIEphc29uIFdhbmcgPGphc293
YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4KPiDlnKggMjAyMi8xLzEwIOS4iuWNiDU6MDYsIEFu
ZHJldyBNZWxueWNoZW5rbyDlhpnpgZM6Cj4gPiBOb3cgaXQncyBwb3NzaWJsZSB0byBjb250cm9s
IHN1cHBvcnRlZCBoYXNoZmxvd3MuCj4gPiBBbHNvIGFkZGVkIGhhc2hmbG93IHNldC9nZXQgY2Fs
bGJhY2tzLgo+ID4gQWxzbywgZGlzYWJsaW5nIFJYSF9JUF9TUkMvRFNUIGZvciBUQ1Agd291bGQg
ZGlzYWJsZSB0aGVuIGZvciBVRFAuCj4gPiBUQ1AgYW5kIFVEUCBzdXBwb3J0cyBvbmx5Ogo+ID4g
ZXRodG9vbCAtVSBldGgwIHJ4LWZsb3ctaGFzaCB0Y3A0IHNkCj4gPiAgICAgIFJYSF9JUF9TUkMg
KyBSWEhfSVBfRFNUCj4gPiBldGh0b29sIC1VIGV0aDAgcngtZmxvdy1oYXNoIHRjcDQgc2Rmbgo+
ID4gICAgICBSWEhfSVBfU1JDICsgUlhIX0lQX0RTVCArIFJYSF9MNF9CXzBfMSArIFJYSF9MNF9C
XzJfMwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBNZWxueWNoZW5rbyA8YW5kcmV3QGRh
eW5peC5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIHwgMTU5ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgMTU5IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdmly
dGlvX25ldC5jIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gPiBpbmRleCA2ZTc0NjFiMDFm
ODcuLjFiOGRkMzg0NDgzYyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQu
Ywo+ID4gKysrIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gPiBAQCAtMjM1LDYgKzIzNSw3
IEBAIHN0cnVjdCB2aXJ0bmV0X2luZm8gewo+ID4gICAgICAgdTggcnNzX2tleV9zaXplOwo+ID4g
ICAgICAgdTE2IHJzc19pbmRpcl90YWJsZV9zaXplOwo+ID4gICAgICAgdTMyIHJzc19oYXNoX3R5
cGVzX3N1cHBvcnRlZDsKPiA+ICsgICAgIHUzMiByc3NfaGFzaF90eXBlc19zYXZlZDsKPiA+Cj4g
PiAgICAgICAvKiBIYXMgY29udHJvbCB2aXJ0cXVldWUgKi8KPiA+ICAgICAgIGJvb2wgaGFzX2N2
cTsKPiA+IEBAIC0yMjc1LDYgKzIyNzYsNyBAQCBzdGF0aWMgdm9pZCB2aXJ0bmV0X2luaXRfZGVm
YXVsdF9yc3Moc3RydWN0IHZpcnRuZXRfaW5mbyAqdmkpCj4gPiAgICAgICBpbnQgaSA9IDA7Cj4g
Pgo+ID4gICAgICAgdmktPmN0cmwtPnJzcy50YWJsZV9pbmZvLmhhc2hfdHlwZXMgPSB2aS0+cnNz
X2hhc2hfdHlwZXNfc3VwcG9ydGVkOwo+ID4gKyAgICAgdmktPnJzc19oYXNoX3R5cGVzX3NhdmVk
ID0gdmktPnJzc19oYXNoX3R5cGVzX3N1cHBvcnRlZDsKPiA+ICAgICAgIHZpLT5jdHJsLT5yc3Mu
dGFibGVfaW5mby5pbmRpcmVjdGlvbl90YWJsZV9tYXNrID0gdmktPnJzc19pbmRpcl90YWJsZV9z
aXplIC0gMTsKPiA+ICAgICAgIHZpLT5jdHJsLT5yc3MudGFibGVfaW5mby51bmNsYXNzaWZpZWRf
cXVldWUgPSAwOwo+ID4KPiA+IEBAIC0yMjg5LDYgKzIyOTEsMTMxIEBAIHN0YXRpYyB2b2lkIHZp
cnRuZXRfaW5pdF9kZWZhdWx0X3JzcyhzdHJ1Y3QgdmlydG5ldF9pbmZvICp2aSkKPiA+ICAgICAg
IG5ldGRldl9yc3Nfa2V5X2ZpbGwodmktPmN0cmwtPnJzcy5rZXksIHZpLT5yc3Nfa2V5X3NpemUp
Owo+ID4gICB9Cj4gPgo+ID4gK3N0YXRpYyB2b2lkIHZpcnRuZXRfZ2V0X2hhc2hmbG93KGNvbnN0
IHN0cnVjdCB2aXJ0bmV0X2luZm8gKnZpLCBzdHJ1Y3QgZXRodG9vbF9yeG5mYyAqaW5mbykKPiA+
ICt7Cj4gPiArICAgICBpbmZvLT5kYXRhID0gMDsKPiA+ICsgICAgIHN3aXRjaCAoaW5mby0+Zmxv
d190eXBlKSB7Cj4gPiArICAgICBjYXNlIFRDUF9WNF9GTE9XOgo+ID4gKyAgICAgICAgICAgICBp
ZiAodmktPnJzc19oYXNoX3R5cGVzX3NhdmVkICYgVklSVElPX05FVF9SU1NfSEFTSF9UWVBFX1RD
UHY0KSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaW5mby0+ZGF0YSA9IFJYSF9JUF9TUkMg
fCBSWEhfSVBfRFNUIHwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgUlhIX0w0X0JfMF8xIHwgUlhIX0w0X0JfMl8zOwo+ID4gKyAgICAgICAgICAgICB9
IGVsc2UgaWYgKHZpLT5yc3NfaGFzaF90eXBlc19zYXZlZCAmIFZJUlRJT19ORVRfUlNTX0hBU0hf
VFlQRV9JUHY0KSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaW5mby0+ZGF0YSA9IFJYSF9J
UF9TUkMgfCBSWEhfSVBfRFNUOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAg
IGJyZWFrOwo+ID4gKyAgICAgY2FzZSBUQ1BfVjZfRkxPVzoKPiA+ICsgICAgICAgICAgICAgaWYg
KHZpLT5yc3NfaGFzaF90eXBlc19zYXZlZCAmIFZJUlRJT19ORVRfUlNTX0hBU0hfVFlQRV9UQ1B2
Nikgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGluZm8tPmRhdGEgPSBSWEhfSVBfU1JDIHwg
UlhIX0lQX0RTVCB8Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFJYSF9MNF9CXzBfMSB8IFJYSF9MNF9CXzJfMzsKPiA+ICsgICAgICAgICAgICAgfSBl
bHNlIGlmICh2aS0+cnNzX2hhc2hfdHlwZXNfc2F2ZWQgJiBWSVJUSU9fTkVUX1JTU19IQVNIX1RZ
UEVfSVB2Nikgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGluZm8tPmRhdGEgPSBSWEhfSVBf
U1JDIHwgUlhIX0lQX0RTVDsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gKyAgICAgICAgICAgICBi
cmVhazsKPiA+ICsgICAgIGNhc2UgVURQX1Y0X0ZMT1c6Cj4gPiArICAgICAgICAgICAgIGlmICh2
aS0+cnNzX2hhc2hfdHlwZXNfc2F2ZWQgJiBWSVJUSU9fTkVUX1JTU19IQVNIX1RZUEVfVURQdjQp
IHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpbmZvLT5kYXRhID0gUlhIX0lQX1NSQyB8IFJY
SF9JUF9EU1QgfAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBSWEhfTDRfQl8wXzEgfCBSWEhfTDRfQl8yXzM7Cj4gPiArICAgICAgICAgICAgIH0gZWxz
ZSBpZiAodmktPnJzc19oYXNoX3R5cGVzX3NhdmVkICYgVklSVElPX05FVF9SU1NfSEFTSF9UWVBF
X0lQdjQpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpbmZvLT5kYXRhID0gUlhIX0lQX1NS
QyB8IFJYSF9JUF9EU1Q7Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgYnJl
YWs7Cj4gPiArICAgICBjYXNlIFVEUF9WNl9GTE9XOgo+ID4gKyAgICAgICAgICAgICBpZiAodmkt
PnJzc19oYXNoX3R5cGVzX3NhdmVkICYgVklSVElPX05FVF9SU1NfSEFTSF9UWVBFX1VEUHY2KSB7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaW5mby0+ZGF0YSA9IFJYSF9JUF9TUkMgfCBSWEhf
SVBfRFNUIHwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgUlhIX0w0X0JfMF8xIHwgUlhIX0w0X0JfMl8zOwo+ID4gKyAgICAgICAgICAgICB9IGVsc2Ug
aWYgKHZpLT5yc3NfaGFzaF90eXBlc19zYXZlZCAmIFZJUlRJT19ORVRfUlNTX0hBU0hfVFlQRV9J
UHY2KSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaW5mby0+ZGF0YSA9IFJYSF9JUF9TUkMg
fCBSWEhfSVBfRFNUOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgIGJyZWFr
Owo+ID4gKyAgICAgY2FzZSBJUFY0X0ZMT1c6Cj4gPiArICAgICAgICAgICAgIGlmICh2aS0+cnNz
X2hhc2hfdHlwZXNfc2F2ZWQgJiBWSVJUSU9fTkVUX1JTU19IQVNIX1RZUEVfSVB2NCkKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBpbmZvLT5kYXRhID0gUlhIX0lQX1NSQyB8IFJYSF9JUF9EU1Q7
Cj4gPiArCj4gPiArICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgY2FzZSBJUFY2X0ZMT1c6
Cj4gPiArICAgICAgICAgICAgIGlmICh2aS0+cnNzX2hhc2hfdHlwZXNfc2F2ZWQgJiBWSVJUSU9f
TkVUX1JTU19IQVNIX1RZUEVfSVB2NCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpbmZvLT5k
YXRhID0gUlhIX0lQX1NSQyB8IFJYSF9JUF9EU1Q7Cj4gPiArCj4gPiArICAgICAgICAgICAgIGJy
ZWFrOwo+ID4gKyAgICAgZGVmYXVsdDoKPiA+ICsgICAgICAgICAgICAgaW5mby0+ZGF0YSA9IDA7
Cj4gPiArICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgfQo+ID4gK30KPiA+ICsKPiA+ICtz
dGF0aWMgYm9vbCB2aXJ0bmV0X3NldF9oYXNoZmxvdyhzdHJ1Y3QgdmlydG5ldF9pbmZvICp2aSwg
c3RydWN0IGV0aHRvb2xfcnhuZmMgKmluZm8pCj4gPiArewo+ID4gKyAgICAgdTY0IGlzX2lwaGFz
aCA9IGluZm8tPmRhdGEgJiAoUlhIX0lQX1NSQyB8IFJYSF9JUF9EU1QpOwo+ID4gKyAgICAgdTY0
IGlzX3BvcnRoYXNoID0gaW5mby0+ZGF0YSAmIChSWEhfTDRfQl8wXzEgfCBSWEhfTDRfQl8yXzMp
Owo+ID4gKyAgICAgdTMyIG5ld19oYXNodHlwZXMgPSB2aS0+cnNzX2hhc2hfdHlwZXNfc2F2ZWQ7
Cj4gPiArCj4gPiArICAgICBpZiAoKGlzX2lwaGFzaCAmJiAoaXNfaXBoYXNoICE9IChSWEhfSVBf
U1JDIHwgUlhIX0lQX0RTVCkpKSB8fAo+ID4gKyAgICAgICAgIChpc19wb3J0aGFzaCAmJiAoaXNf
cG9ydGhhc2ggIT0gKFJYSF9MNF9CXzBfMSB8IFJYSF9MNF9CXzJfMykpKSkgewo+ID4gKyAgICAg
ICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICBpZiAoIWlz
X2lwaGFzaCAmJiBpc19wb3J0aGFzaCkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+
Cj4KPiBUaGlzIHNlZW1zIG5vdCBmaWx0ZXIgb3V0IGFsbCB0aGUgY29tYmluYXRpb25zOgo+Cj4g
ZS5nIFJYSF9WTEFOIHdpdGggcG9ydCBoYXNoPwo+Cj4KPiA+ICsKPiA+ICsgICAgIHN3aXRjaCAo
aW5mby0+Zmxvd190eXBlKSB7Cj4gPiArICAgICBjYXNlIFRDUF9WNF9GTE9XOgo+ID4gKyAgICAg
Y2FzZSBVRFBfVjRfRkxPVzoKPiA+ICsgICAgIGNhc2UgSVBWNF9GTE9XOgo+ID4gKyAgICAgICAg
ICAgICBuZXdfaGFzaHR5cGVzICY9IH5WSVJUSU9fTkVUX1JTU19IQVNIX1RZUEVfSVB2NDsKPiA+
ICsgICAgICAgICAgICAgaWYgKGlzX2lwaGFzaCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBu
ZXdfaGFzaHR5cGVzIHw9IFZJUlRJT19ORVRfUlNTX0hBU0hfVFlQRV9JUHY0Owo+ID4gKwo+ID4g
KyAgICAgICAgICAgICBicmVhazsKPiA+ICsgICAgIGNhc2UgVENQX1Y2X0ZMT1c6Cj4gPiArICAg
ICBjYXNlIFVEUF9WNl9GTE9XOgo+ID4gKyAgICAgY2FzZSBJUFY2X0ZMT1c6Cj4gPiArICAgICAg
ICAgICAgIG5ld19oYXNodHlwZXMgJj0gflZJUlRJT19ORVRfUlNTX0hBU0hfVFlQRV9JUHY2Owo+
ID4gKyAgICAgICAgICAgICBpZiAoaXNfaXBoYXNoKQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IG5ld19oYXNodHlwZXMgfD0gVklSVElPX05FVF9SU1NfSEFTSF9UWVBFX0lQdjY7Cj4gPiArCj4g
PiArICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgZGVmYXVsdDoKPiA+ICsgICAgICAgICAg
ICAgYnJlYWs7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICBzd2l0Y2ggKGluZm8tPmZsb3df
dHlwZSkgewo+ID4gKyAgICAgY2FzZSBUQ1BfVjRfRkxPVzoKPiA+ICsgICAgICAgICAgICAgbmV3
X2hhc2h0eXBlcyAmPSB+VklSVElPX05FVF9SU1NfSEFTSF9UWVBFX1RDUHY0Owo+Cj4KPiBBbnkg
d2F5IHRvIG1lcmdlIHRoZSB0d28gc3dpdGNoPyBUaGUgY29kZSBpcyBoYXJkIHRvIGJlIHJldmll
d2VkIGFueWhvdy4KPgo+Cj4gPiArICAgICAgICAgICAgIGlmIChpc19wb3J0aGFzaCkKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBuZXdfaGFzaHR5cGVzIHw9IFZJUlRJT19ORVRfUlNTX0hBU0hf
VFlQRV9UQ1B2NDsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICBjYXNl
IFVEUF9WNF9GTE9XOgo+ID4gKyAgICAgICAgICAgICBuZXdfaGFzaHR5cGVzICY9IH5WSVJUSU9f
TkVUX1JTU19IQVNIX1RZUEVfVURQdjQ7Cj4gPiArICAgICAgICAgICAgIGlmIChpc19wb3J0aGFz
aCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBuZXdfaGFzaHR5cGVzIHw9IFZJUlRJT19ORVRf
UlNTX0hBU0hfVFlQRV9VRFB2NDsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgYnJlYWs7Cj4gPiAr
ICAgICBjYXNlIFRDUF9WNl9GTE9XOgo+ID4gKyAgICAgICAgICAgICBuZXdfaGFzaHR5cGVzICY9
IH5WSVJUSU9fTkVUX1JTU19IQVNIX1RZUEVfVENQdjY7Cj4gPiArICAgICAgICAgICAgIGlmIChp
c19wb3J0aGFzaCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBuZXdfaGFzaHR5cGVzIHw9IFZJ
UlRJT19ORVRfUlNTX0hBU0hfVFlQRV9UQ1B2NjsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgYnJl
YWs7Cj4gPiArICAgICBjYXNlIFVEUF9WNl9GTE9XOgo+ID4gKyAgICAgICAgICAgICBuZXdfaGFz
aHR5cGVzICY9IH5WSVJUSU9fTkVUX1JTU19IQVNIX1RZUEVfVURQdjY7Cj4gPiArICAgICAgICAg
ICAgIGlmIChpc19wb3J0aGFzaCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBuZXdfaGFzaHR5
cGVzIHw9IFZJUlRJT19ORVRfUlNTX0hBU0hfVFlQRV9VRFB2NjsKPiA+ICsKPiA+ICsgICAgICAg
ICAgICAgYnJlYWs7Cj4gPiArICAgICBkZWZhdWx0Ogo+ID4gKyAgICAgICAgICAgICBicmVhazsK
PiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIGlmIChuZXdfaGFzaHR5cGVzICE9IHZpLT5yc3Nf
aGFzaF90eXBlc19zYXZlZCkgewo+ID4gKyAgICAgICAgICAgICB2aS0+cnNzX2hhc2hfdHlwZXNf
c2F2ZWQgPSBuZXdfaGFzaHR5cGVzOwo+ID4gKyAgICAgICAgICAgICB2aS0+Y3RybC0+cnNzLnRh
YmxlX2luZm8uaGFzaF90eXBlcyA9IHZpLT5yc3NfaGFzaF90eXBlc19zYXZlZDsKPiA+ICsgICAg
ICAgICAgICAgaWYgKHZpLT5kZXYtPmZlYXR1cmVzICYgTkVUSUZfRl9SWEhBU0gpCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIHZpcnRuZXRfY29tbWl0X3Jzc19jb21tYW5kKHZpKTsK
PiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIHJldHVybiB0cnVlOwo+ID4gK30KPiA+Cj4gPiAg
IHN0YXRpYyB2b2lkIHZpcnRuZXRfZ2V0X2RydmluZm8oc3RydWN0IG5ldF9kZXZpY2UgKmRldiwK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBldGh0b29sX2RydmluZm8g
KmluZm8pCj4gPiBAQCAtMjU3NCw2ICsyNzAxLDI3IEBAIHN0YXRpYyBpbnQgdmlydG5ldF9nZXRf
cnhuZmMoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwgc3RydWN0IGV0aHRvb2xfcnhuZmMgKmluZm8s
Cj4gPiAgICAgICBzd2l0Y2ggKGluZm8tPmNtZCkgewo+ID4gICAgICAgY2FzZSBFVEhUT09MX0dS
WFJJTkdTOgo+ID4gICAgICAgICAgICAgICBpbmZvLT5kYXRhID0gdmktPmN1cnJfcXVldWVfcGFp
cnM7Cj4gPiArICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgY2FzZSBFVEhUT09MX0dSWEZI
Ogo+ID4gKyAgICAgICAgICAgICB2aXJ0bmV0X2dldF9oYXNoZmxvdyh2aSwgaW5mbyk7Cj4gPiAr
ICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgZGVmYXVsdDoKPiA+ICsgICAgICAgICAgICAg
cmMgPSAtRU9QTk9UU1VQUDsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIHJldHVybiByYzsK
PiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGludCB2aXJ0bmV0X3NldF9yeG5mYyhzdHJ1Y3QgbmV0
X2RldmljZSAqZGV2LCBzdHJ1Y3QgZXRodG9vbF9yeG5mYyAqaW5mbykKPiA+ICt7Cj4gPiArICAg
ICBzdHJ1Y3QgdmlydG5ldF9pbmZvICp2aSA9IG5ldGRldl9wcml2KGRldik7Cj4gPiArICAgICBp
bnQgcmMgPSAwOwo+ID4gKwo+ID4gKyAgICAgc3dpdGNoIChpbmZvLT5jbWQpIHsKPiA+ICsgICAg
IGNhc2UgRVRIVE9PTF9TUlhGSDoKPiA+ICsgICAgICAgICAgICAgaWYgKCF2aXJ0bmV0X3NldF9o
YXNoZmxvdyh2aSwgaW5mbykpCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmMgPSAtRUlOVkFM
Owo+ID4gKwo+ID4gICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgIGRlZmF1bHQ6Cj4gPiAg
ICAgICAgICAgICAgIHJjID0gLUVPUE5PVFNVUFA7Cj4gPiBAQCAtMjYwMiw2ICsyNzUwLDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBldGh0b29sX29wcyB2aXJ0bmV0X2V0aHRvb2xfb3BzID0gewo+
ID4gICAgICAgLmdldF9yeGZoID0gdmlydG5ldF9nZXRfcnhmaCwKPiA+ICAgICAgIC5zZXRfcnhm
aCA9IHZpcnRuZXRfc2V0X3J4ZmgsCj4gPiAgICAgICAuZ2V0X3J4bmZjID0gdmlydG5ldF9nZXRf
cnhuZmMsCj4gPiArICAgICAuc2V0X3J4bmZjID0gdmlydG5ldF9zZXRfcnhuZmMsCj4gPiAgIH07
Cj4gPgo+ID4gICBzdGF0aWMgdm9pZCB2aXJ0bmV0X2ZyZWV6ZV9kb3duKHN0cnVjdCB2aXJ0aW9f
ZGV2aWNlICp2ZGV2KQo+ID4gQEAgLTI4NTQsNiArMzAwMywxNiBAQCBzdGF0aWMgaW50IHZpcnRu
ZXRfc2V0X2ZlYXR1cmVzKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsCj4gPiAgICAgICAgICAgICAg
IHZpLT5ndWVzdF9vZmZsb2FkcyA9IG9mZmxvYWRzOwo+ID4gICAgICAgfQo+ID4KPiA+ICsgICAg
IGlmICgoZGV2LT5mZWF0dXJlcyBeIGZlYXR1cmVzKSAmIE5FVElGX0ZfUlhIQVNIKSB7Cj4gPiAr
ICAgICAgICAgICAgIGlmIChmZWF0dXJlcyAmIE5FVElGX0ZfUlhIQVNIKQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIHZpLT5jdHJsLT5yc3MudGFibGVfaW5mby5oYXNoX3R5cGVzID0gdmktPnJz
c19oYXNoX3R5cGVzX3NhdmVkOwo+ID4gKyAgICAgICAgICAgICBlbHNlCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgdmktPmN0cmwtPnJzcy50YWJsZV9pbmZvLmhhc2hfdHlwZXMgPSAwOwo+Cj4K
PiBJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIHVzZSBWSVJUSU9fTkVUX0hBU0hfUkVQT1JUX05PTkUg
aGVyZS4KPgo+IFRoYW5rcwo+Cj4KPiA+ICsKPiA+ICsgICAgICAgICAgICAgaWYgKCF2aXJ0bmV0
X2NvbW1pdF9yc3NfY29tbWFuZCh2aSkpCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7Cj4gPiArICAgICB9Cj4gPiArCj4gPiAgICAgICByZXR1cm4gMDsKPiA+ICAgfQo+
ID4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
