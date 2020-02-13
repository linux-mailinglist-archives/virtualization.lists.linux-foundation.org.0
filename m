Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CDABC15BF03
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 14:12:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EC2B287F34;
	Thu, 13 Feb 2020 13:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xHTda+nz8XGd; Thu, 13 Feb 2020 13:12:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 100D587EA2;
	Thu, 13 Feb 2020 13:12:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0315EC0177;
	Thu, 13 Feb 2020 13:12:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDDBBC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 13:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AC0A5203D2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 13:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id izgX-TnrgTmt
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 13:12:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 597A320372
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 13:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581599542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsQZ3q+lcvXCCh85Qi7IpJnWbcPUNf37iJtXE8O7tyE=;
 b=JDBvwEZAfSUanRh3xw6nDE1NkTbh5nvPantMl8UR7melwDEjj1539QjgrK9LLt3+0oDP7J
 1WokIBISm3p12hBTn5NAfhYZOe6tFXH7eSjk8x67EfSS8MwV0iM0q0DVuLxdWy1hoKBjJL
 5mioTLWV+jqvapFTmU/fRBHYgLP8V/g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-vLF5lTM0MZCfnxTC3uys5g-1; Thu, 13 Feb 2020 08:12:15 -0500
Received: by mail-wm1-f72.google.com with SMTP id b133so2329616wmb.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 05:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wsQZ3q+lcvXCCh85Qi7IpJnWbcPUNf37iJtXE8O7tyE=;
 b=Nfk+x6zn9cXUHPqeTkWG1DutbWR/MJA0XK/XZVZJbAvCshE2HFNF7RXTTOZjS1t4xj
 x5sVFq2RJBG4pTrjM8o/oOYem+seJb9e2w3TtbGfNEesGIDyCDTDa2/xhvagXBYgLVdF
 cVEFi2De7UkRavrAC5ZZGwSIuVLhfJjzkQwaVbISfTZ4xgiwcMCHrFEgyBPhaVItI/My
 XiScqROYwWVU5BeRZkL0iyas/wCpiMNSKVVdq6CWBlEMfpn/ohuaErBi76prvv2pHtsZ
 boDn2Y3cbfwWjS1k2Cr9Hqwbslar4f4YT1fAi0j3LYjw+5ftv5uh+MBzs3eObfB4eeuL
 Q//g==
X-Gm-Message-State: APjAAAUc+AZoe77+MFqfqYGwVcJy4vFOJJ92uHPqtZp5futW3wSi/xh9
 7rPnaXbLM3cx6jP40NxIIBD+9RRZVmiwAcBYXw1PPMfh7Wpc+lLD9GeDj3ij74ghy9qEvqJBMlB
 n+hX6OYNFB7R/xiFjeIyvXpyqlEBxnJW6I1sQnwrW8g==
X-Received: by 2002:a1c:7d93:: with SMTP id y141mr5715547wmc.111.1581599534676; 
 Thu, 13 Feb 2020 05:12:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqzTTvnhnAah+aJFeotACloGF4Z8cs+TlgrEmrseuB5EWMr6pm93mTatL71DwY45++oS6yAGhQ==
X-Received: by 2002:a1c:7d93:: with SMTP id y141mr5715529wmc.111.1581599534436; 
 Thu, 13 Feb 2020 05:12:14 -0800 (PST)
Received: from redhat.com (bzq-79-176-28-95.red.bezeqint.net. [79.176.28.95])
 by smtp.gmail.com with ESMTPSA id
 q1sm2692269wrw.5.2020.02.13.05.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 05:12:13 -0800 (PST)
Date: Thu, 13 Feb 2020 08:12:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Subject: Re: [PATCH] virtio: Work around frames incorrectly marked as gso
Message-ID: <20200213081154-mutt-send-email-mst@kernel.org>
References: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
 <57230228-7030-c65f-a24f-910ca52bbe9e@cambridgegreys.com>
 <f78bfe6e-2ffc-3734-9618-470f1afea0c6@redhat.com>
 <918222d9-816a-be70-f8af-b8dfcb586240@cambridgegreys.com>
 <20200211053502-mutt-send-email-mst@kernel.org>
 <9547228b-aa93-f2b6-6fdc-8d33cde3716a@cambridgegreys.com>
 <20200213045937-mutt-send-email-mst@kernel.org>
 <54692f06-f687-8bd3-7a1b-3dac3e79110b@cambridgegreys.com>
MIME-Version: 1.0
In-Reply-To: <54692f06-f687-8bd3-7a1b-3dac3e79110b@cambridgegreys.com>
X-MC-Unique: vLF5lTM0MZCfnxTC3uys5g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-um@lists.infradead.org,
 virtualization@lists.linux-foundation.org
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

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMTE6MTI6NDVBTSArMDAwMCwgQW50b24gSXZhbm92IHdy
b3RlOgo+IAo+IAo+IE9uIDEzLzAyLzIwMjAgMTA6MDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPiA+IE9uIFdlZCwgRmViIDEyLCAyMDIwIGF0IDA1OjM4OjA5UE0gKzAwMDAsIEFudG9uIEl2
YW5vdiB3cm90ZToKPiA+ID4gCj4gPiA+IAo+ID4gPiBPbiAxMS8wMi8yMDIwIDEwOjM3LCBNaWNo
YWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgMDc6
NDI6MzdBTSArMDAwMCwgQW50b24gSXZhbm92IHdyb3RlOgo+ID4gPiA+ID4gT24gMTEvMDIvMjAy
MCAwMjo1MSwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IE9uIDIw
MjAvMi8xMSDkuIrljYgxMjo1NSwgQW50b24gSXZhbm92IHdyb3RlOgo+ID4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IE9uIDA5LzEyLzIwMTkgMTA6NDgsIGFudG9uLml2
YW5vdkBjYW1icmlkZ2VncmV5cy5jb20gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiBGcm9tOiBBbnRv
biBJdmFub3YgPGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5cy5jb20+Cj4gPiA+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gPiA+IFNvbWUgb2YgdGhlIGZyYW1lcyBtYXJrZWQgYXMgR1NPIHdoaWNo
IGFycml2ZSBhdAo+ID4gPiA+ID4gPiA+ID4gdmlydGlvX25ldF9oZHJfZnJvbV9za2IoKSBoYXZl
IG5vIEdTT19UWVBFLCBubwo+ID4gPiA+ID4gPiA+ID4gZnJhZ21lbnRzIChkYXRhX2xlbiA9IDAp
IGFuZCBsZW5ndGggc2lnbmlmaWNhbnRseSBzaG9ydGVyCj4gPiA+ID4gPiA+ID4gPiB0aGFuIHRo
ZSBNVFUgKDc1MiBpbiBteSBleHBlcmltZW50cykuCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gPiA+IFRoaXMgaXMgb2JzZXJ2ZWQgb24gcmF3IHNvY2tldHMgcmVhZGluZyBvZmYgdkV0aCBp
bnRlcmZhY2VzCj4gPiA+ID4gPiA+ID4gPiBpbiBhbGwgNC54IGFuZCA1Lngga2VybmVscyBJIHRl
c3RlZC4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gVGhlc2UgZnJhbWVzIGFyZSBy
ZXBvcnRlZCBhcyBpbnZhbGlkIHdoaWxlIHRoZXkgYXJlIGluIGZhY3QKPiA+ID4gPiA+ID4gPiA+
IGdzby1sZXNzIGZyYW1lcy4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gVGhpcyBw
YXRjaCBtYXJrcyB0aGUgdm5ldCBoZWFkZXIgYXMgbm8tR1NPIGZvciB0aGVtIGluc3RlYWQKPiA+
ID4gPiA+ID4gPiA+IG9mIHJlcG9ydGluZyBpdCBhcyBpbnZhbGlkLgo+ID4gPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbnRvbiBJdmFub3YgPGFudG9uLml2YW5v
dkBjYW1icmlkZ2VncmV5cy5jb20+Cj4gPiA+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gPiA+
ICAgwqAgaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmggfCA4ICsrKysrKy0tCj4gPiA+ID4gPiA+
ID4gPiAgIMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L3ZpcnRpb19uZXQuaCBiL2luY2x1ZGUvbGludXgvdmlydGlvX25ldC5oCj4gPiA+ID4gPiA+
ID4gPiBpbmRleCAwZDFmZTkyOTdhYzYuLmQ5MGQ1Y2ZmMWI5YSAxMDA2NDQKPiA+ID4gPiA+ID4g
PiA+IC0tLSBhL2luY2x1ZGUvbGludXgvdmlydGlvX25ldC5oCj4gPiA+ID4gPiA+ID4gPiArKysg
Yi9pbmNsdWRlL2xpbnV4L3ZpcnRpb19uZXQuaAo+ID4gPiA+ID4gPiA+ID4gQEAgLTExMiw4ICsx
MTIsMTIgQEAgc3RhdGljIGlubGluZSBpbnQKPiA+ID4gPiA+ID4gPiA+IHZpcnRpb19uZXRfaGRy
X2Zyb21fc2tiKGNvbnN0IHN0cnVjdCBza19idWZmICpza2IsCj4gPiA+ID4gPiA+ID4gPiAgIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhkci0+Z3NvX3R5cGUgPSBWSVJUSU9fTkVUX0hEUl9H
U09fVENQVjQ7Cj4gPiA+ID4gPiA+ID4gPiAgIMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlIGlmIChz
aW5mby0+Z3NvX3R5cGUgJiBTS0JfR1NPX1RDUFY2KQo+ID4gPiA+ID4gPiA+ID4gICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBoZHItPmdzb190eXBlID0gVklSVElPX05FVF9IRFJfR1NPX1RD
UFY2Owo+ID4gPiA+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgIGVsc2UKPiA+ID4gPiA+ID4gPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+ID4gPiA+ID4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgIGVsc2Ugewo+ID4gPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKHNrYi0+ZGF0YV9sZW4gPT0gMCkKPiA+ID4gPiA+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaGRyLT5nc29fdHlwZSA9IFZJUlRJT19ORVRfSERSX0dTT19O
T05FOwo+ID4gPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZQo+ID4gPiA+
ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsK
PiA+ID4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCB9Cj4gPiA+ID4gPiA+ID4gPiAgIMKgwqDC
oMKgwqDCoMKgwqDCoCBpZiAoc2luZm8tPmdzb190eXBlICYgU0tCX0dTT19UQ1BfRUNOKQo+ID4g
PiA+ID4gPiA+ID4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoZHItPmdzb190eXBlIHw9
IFZJUlRJT19ORVRfSERSX0dTT19FQ047Cj4gPiA+ID4gPiA+ID4gPiAgIMKgwqDCoMKgwqAgfSBl
bHNlCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBwaW5nLgo+
ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gRG8geW91IG1lYW4gZ3NvX3Np
emUgaXMgc2V0IGJ1dCBnc29fdHlwZSBpcyBub3Q/IExvb2tzIGxpa2UgYSBidWcKPiA+ID4gPiA+
ID4gZWxzZXdoZXJlLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gVGhhbmtzCj4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+IFllcy4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gSSBjb3Vs
ZCBub3QgdHJhY2UgaXQgd2hlcmUgaXQgaXMgY29taW5nIGZyb20uCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IEkgc2VlIGl0IHdoZW4gZG9pbmcgcmVjdm1tc2cgb24gcmF3IHNvY2tldHMgaW4gdGhlIFVN
TCB2ZWN0b3IgbmV0d29yawo+ID4gPiA+ID4gZHJpdmVycy4KPiA+ID4gPiA+IAo+ID4gPiA+IAo+
ID4gPiA+IEkgdGhpbmsgd2UgbmVlZCB0byBmaW5kIHRoZSBjdWxwcml0IGFuZCBmaXggaXQgdGhl
cmUsIGxvdHMgb2Ygb3RoZXIgdGhpbmdzCj4gPiA+ID4gY2FuIGJyZWFrIG90aGVyd2lzZS4KPiA+
ID4gPiBKdXN0IHByaW50aW5nIG91dCBza2ItPmRldi0+bmFtZSBzaG91bGQgZG8gdGhlIHRyaWNr
LCBubz8KPiA+ID4gCj4gPiA+IFRoZSBwcmludGsgaW4gdmlydGlvX25ldF9oZHJfZnJvbV9za2Ig
c2F5cyBOVUxMLgo+ID4gPiAKPiA+ID4gVGhhdCBpcyBwcm9iYWJseSBub3JtYWwgZm9yIGEgbG9j
YWxseSBvcmlnaW5hdGVkIGZyYW1lLgo+ID4gPiAKPiA+ID4gSSBjYW5ub3QgcmVwcm9kdWNlIHRo
aXMgd2l0aCBuZXR3b3JrIHRyYWZmaWMgYnkgdGhlIHdheSAtIGl0IGhhcHBlbnMgb25seSBpZiB0
aGUgdHJhZmZpYyBpcyBsb2NhbGx5IG9yaWdpbmF0ZWQgb24gdGhlIGhvc3QuCj4gPiA+IAo+ID4g
PiBBLAo+ID4gCj4gPiBPSyBzbyBpcyBpdCBjb2RlIGluIF9fdGNwX3RyYW5zbWl0X3NrYiB0aGF0
IHNldHMgZ3NvX3NpemUgdG8gbm9uLW51bGwKPiA+IHdoZW4gZ3NvX3R5cGUgaXMgMD8KPiAKPiBJ
dCBkb2VzIGxvb2sgbGlrZSB0aGF0LCBidXQgSSBjYW5ub3Qgc2VlIGl0IHdoZW4gcmVhZGluZyBp
dCA6KAoKZHVtcCBza2IgcG9pbnRlciBhdCB0aGUgdHdvIGxvY2F0aW9ucyBhbmQgc2VlIHdoZXRo
ZXIgaXQgbWF0Y2hlcyA6KQoKPiAKPiA+IAo+ID4gCj4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4g
PiAtLSAKPiA+ID4gPiA+IEFudG9uIFIuIEl2YW5vdgo+ID4gPiA+ID4gQ2FtYnJpZGdlZ3JleXMg
TGltaXRlZC4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5kLiBDb21wYW55IE51bWJlciAxMDI3MzY2MQo+
ID4gPiA+ID4gaHR0cHM6Ly93d3cuY2FtYnJpZGdlZ3JleXMuY29tLwo+ID4gPiA+IAo+ID4gPiA+
IAo+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPiA+ID4gbGludXgtdW0gbWFpbGluZyBsaXN0Cj4gPiA+ID4gbGludXgtdW1AbGlzdHMuaW5m
cmFkZWFkLm9yZwo+ID4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtdW0KPiA+ID4gPiAKPiA+ID4gCj4gPiA+IC0tIAo+ID4gPiBBbnRvbiBSLiBJ
dmFub3YKPiA+ID4gQ2FtYnJpZGdlZ3JleXMgTGltaXRlZC4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5k
LiBDb21wYW55IE51bWJlciAxMDI3MzY2MQo+ID4gPiBodHRwczovL3d3dy5jYW1icmlkZ2VncmV5
cy5jb20vCj4gPiAKPiA+IAo+IAo+IC0tIAo+IEFudG9uIFIuIEl2YW5vdgo+IENhbWJyaWRnZWdy
ZXlzIExpbWl0ZWQuIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZC4gQ29tcGFueSBOdW1iZXIgMTAyNzM2
NjEKPiBodHRwczovL3d3dy5jYW1icmlkZ2VncmV5cy5jb20vCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
