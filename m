Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CAC4E6FE8
	for <lists.virtualization@lfdr.de>; Fri, 25 Mar 2022 10:20:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56AEC84489;
	Fri, 25 Mar 2022 09:20:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8TehIMrqX3A8; Fri, 25 Mar 2022 09:20:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7B9CB844A9;
	Fri, 25 Mar 2022 09:20:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F08A4C0073;
	Fri, 25 Mar 2022 09:20:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1D24C0012
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Mar 2022 09:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA18E41CE1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Mar 2022 09:20:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z6KKMIUqkmtW
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Mar 2022 09:20:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B51C41CB5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Mar 2022 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648200033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXIP1Rw0LQhtyiCdp9pTT5xYNdy6HRviyAeikWaT2hM=;
 b=PyJ6ElbqT/zlARpjs770jDBp2KP7yOkDBGxqfhwjLVSvFbyMD9jroT9P6+KtwIT2ijes2u
 GiL4qWRuGE+40O9oHjdwlPStllTXgOp+rk37m/lLKlV7KtnP0jOPB/Zr2nHe/d8L6J6cW+
 uJFm5Sv8IKDqsbyWQ3bTytgWOuubCrc=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-oi5GUPi2NlaaXsm3erauyg-1; Fri, 25 Mar 2022 05:20:32 -0400
X-MC-Unique: oi5GUPi2NlaaXsm3erauyg-1
Received: by mail-lj1-f199.google.com with SMTP id
 t10-20020a2e2d0a000000b002496423e4adso2766161ljt.16
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Mar 2022 02:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rXIP1Rw0LQhtyiCdp9pTT5xYNdy6HRviyAeikWaT2hM=;
 b=jfBd4BhI1nJm087gA3XkiPf6UncXePLOCzxZH3nQEKQaJPYzh0qmVbYP2CIKC4Vn2o
 2ZBR+5DhAihtpniTc7yrQAydBG73UJE1uaNz0zKZsOJW3xChJyC48rw/qiRht+Ms+YxT
 iHtr+Asehk7IoG45sgDqgENm2oDiTT8c+K1rsvDniLwtOr/nyReZiGi4T88xEUjdMKrq
 P6apF3hZAZbrZb736I7uw/74MmEJ6xXZjmZcaktPn4H6dgY19hxO2SWqVt03PaSGc2Xp
 5WJZ0DZZiD0cbx0wJJd7sW4COMJNo0RVuQFKYfJZqL5/RF1RF/ZD/bs7CP1ry59w7bup
 Uj0g==
X-Gm-Message-State: AOAM533pJluilQDjZZ/lwrW6TiEpyj7e0nk13RzDTbjiDvztI6Eh2gOu
 QqiBjFuMCO4Unsw1/rz7rrV3nr5yZ9SAfZk+g2RWQS9jq+o4gZz/QsY4+LOsJWfJBvAkPqvsjlF
 IlHdEMEEXgQwSK5jZC3yoKQS8DMI1XVplLWDBH2NrO3l1JJNvzMD/2o9gkQ==
X-Received: by 2002:a2e:824e:0:b0:249:7e3d:c862 with SMTP id
 j14-20020a2e824e000000b002497e3dc862mr7451772ljh.97.1648200030761; 
 Fri, 25 Mar 2022 02:20:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwQPFAkDsHKfOpNdK1hYzpQCzJk+7WJW/ZHNE6+NG6h8zeIQzMgCfe9gB44b3VZqzOWEM2PPJkKlUnLSKt1W8=
X-Received: by 2002:a2e:824e:0:b0:249:7e3d:c862 with SMTP id
 j14-20020a2e824e000000b002497e3dc862mr7451746ljh.97.1648200030327; Fri, 25
 Mar 2022 02:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <Yj1hkpyUqJE9sQ2p@redhat.com>
 <CACGkMEunsuWhn+aB2dM7noU257M9JV6jDjkQXLyOA+GjEoz_iw@mail.gmail.com>
 <20220325050947-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220325050947-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 25 Mar 2022 17:20:19 +0800
Message-ID: <CACGkMEvioAVMmB+ab2xXB2YPECtwi1J55u8mRRk9-JAjFSZ8vg@mail.gmail.com>
Subject: Re:
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>,
 Keir Fraser <keirf@google.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
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

T24gRnJpLCBNYXIgMjUsIDIwMjIgYXQgNToxMCBQTSBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgTWFyIDI1LCAyMDIyIGF0IDAzOjUyOjAwUE0g
KzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiBPbiBGcmksIE1hciAyNSwgMjAyMiBhdCAyOjMx
IFBNIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPgo+ID4g
PiBCY2M6Cj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy8zXSB2aXJ0aW86IGhhcmRlbiB2cmlu
ZyBJUlEKPiA+ID4gTWVzc2FnZS1JRDogPDIwMjIwMzI1MDIxNDIyLW11dHQtc2VuZC1lbWFpbC1t
c3RAa2VybmVsLm9yZz4KPiA+ID4gUmVwbHktVG86Cj4gPiA+IEluLVJlcGx5LVRvOiA8ZjcwNDYz
MDMtN2Q3ZC1lMzlmLTNjNzEtMzY4ODEyNmNjODEyQHJlZGhhdC5jb20+Cj4gPiA+Cj4gPiA+IE9u
IEZyaSwgTWFyIDI1LCAyMDIyIGF0IDExOjA0OjA4QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6
Cj4gPiA+ID4KPiA+ID4gPiDlnKggMjAyMi8zLzI0IOS4i+WNiDc6MDMsIE1pY2hhZWwgUy4gVHNp
cmtpbiDlhpnpgZM6Cj4gPiA+ID4gPiBPbiBUaHUsIE1hciAyNCwgMjAyMiBhdCAwNDo0MDowNFBN
ICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gPiBUaGlzIGlzIGEgcmV3b3JrIG9u
IHRoZSBwcmV2aW91cyBJUlEgaGFyZGVuaW5nIHRoYXQgaXMgZG9uZSBmb3IKPiA+ID4gPiA+ID4g
dmlydGlvLXBjaSB3aGVyZSBzZXZlcmFsIGRyYXdiYWNrcyB3ZXJlIGZvdW5kIGFuZCB3ZXJlIHJl
dmVydGVkOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAxKSB0cnkgdG8gdXNlIElSUUZfTk9fQVVU
T0VOIHdoaWNoIGlzIG5vdCBmcmllbmRseSB0byBhZmZpbml0eSBtYW5hZ2VkIElSUQo+ID4gPiA+
ID4gPiAgICAgdGhhdCBpcyB1c2VkIGJ5IHNvbWUgZGV2aWNlIHN1Y2ggYXMgdmlydGlvLWJsawo+
ID4gPiA+ID4gPiAyKSBkb25lIG9ubHkgZm9yIFBDSSB0cmFuc3BvcnQKPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gSW4gdGhpcyBwYXRjaCwgd2UgdHJpZXMgdG8gYm9ycm93IHRoZSBpZGVhIGZyb20g
dGhlIElOVFggSVJRIGhhcmRlbmluZwo+ID4gPiA+ID4gPiBpbiB0aGUgcmV2ZXJ0ZWQgY29tbWl0
IDA4MGNkN2MzYWM4NyAoInZpcnRpby1wY2k6IGhhcmRlbiBJTlRYIGludGVycnVwdHMiKQo+ID4g
PiA+ID4gPiBieSBpbnRyb2R1Y2luZyBhIGdsb2JhbCBpcnFfc29mdF9lbmFibGVkIHZhcmlhYmxl
IGZvciBlYWNoCj4gPiA+ID4gPiA+IHZpcnRpb19kZXZpY2UuIFRoZW4gd2UgY2FuIHRvIHRvZ2ds
ZSBpdCBkdXJpbmcKPiA+ID4gPiA+ID4gdmlydGlvX3Jlc2V0X2RldmljZSgpL3ZpcnRpb19kZXZp
Y2VfcmVhZHkoKS4gQSBzeW5jaG9ybml6ZV9yY3UoKSBpcwo+ID4gPiA+ID4gPiB1c2VkIGluIHZp
cnRpb19yZXNldF9kZXZpY2UoKSB0byBzeW5jaHJvbml6ZSB3aXRoIHRoZSBJUlEgaGFuZGxlcnMu
IEluCj4gPiA+ID4gPiA+IHRoZSBmdXR1cmUsIHdlIG1heSBwcm92aWRlIGNvbmZpZ19vcHMgZm9y
IHRoZSB0cmFuc3BvcnQgdGhhdCBkb2Vzbid0Cj4gPiA+ID4gPiA+IHVzZSBJUlEuIFdpdGggdGhp
cywgdnJpbmdfaW50ZXJydXB0KCkgY2FuIHJldHVybiBjaGVjayBhbmQgZWFybHkgaWYKPiA+ID4g
PiA+ID4gaXJxX3NvZnRfZW5hYmxlZCBpcyBmYWxzZS4gVGhpcyBsZWFkIHRvIHNtcF9sb2FkX2Fj
cXVpcmUoKSB0byBiZSB1c2VkCj4gPiA+ID4gPiA+IGJ1dCB0aGUgY29zdCBzaG91bGQgYmUgYWNj
ZXB0YWJsZS4KPiA+ID4gPiA+IE1heWJlIGl0IHNob3VsZCBiZSBidXQgaXMgaXQ/IENhbid0IHdl
IHVzZSBzeW5jaHJvbml6ZV9pcnEgaW5zdGVhZD8KPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gRXZl
biBpZiB3ZSBhbGxvdyB0aGUgdHJhbnNwb3J0IGRyaXZlciB0byBzeW5jaG9ybml6ZSB0aHJvdWdo
Cj4gPiA+ID4gc3luY2hyb25pemVfaXJxKCkgd2Ugc3RpbGwgbmVlZCBhIGNoZWNrIGluIHRoZSB2
cmluZ19pbnRlcnJ1cHQoKS4KPiA+ID4gPgo+ID4gPiA+IFdlIGRvIHNvbWV0aGluZyBsaWtlIHRo
ZSBmb2xsb3dpbmcgcHJldmlvdXNseToKPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgaWYgKCFSRUFE
X09OQ0UodnBfZGV2LT5pbnR4X3NvZnRfZW5hYmxlZCkpCj4gPiA+ID4gICAgICAgICAgICAgICAg
IHJldHVybiBJUlFfTk9ORTsKPiA+ID4gPgo+ID4gPiA+IEJ1dCBpdCBsb29rcyBsaWtlIGEgYnVn
IHNpbmNlIHNwZWN1bGF0aXZlIHJlYWQgY2FuIGJlIGRvbmUgYmVmb3JlIHRoZSBjaGVjawo+ID4g
PiA+IHdoZXJlIHRoZSBpbnRlcnJ1cHQgaGFuZGxlciBjYW4ndCBzZWUgdGhlIHVuY29tbWl0dGVk
IHNldHVwIHdoaWNoIGlzIGRvbmUgYnkKPiA+ID4gPiB0aGUgZHJpdmVyLgo+ID4gPgo+ID4gPiBJ
IGRvbid0IHRoaW5rIHNvIC0gaWYgeW91IHN5bmMgYWZ0ZXIgc2V0dGluZyB0aGUgdmFsdWUgdGhl
bgo+ID4gPiB5b3UgYXJlIGd1YXJhbnRlZWQgdGhhdCBhbnkgaGFuZGxlciBydW5uaW5nIGFmdGVy
d2FyZHMKPiA+ID4gd2lsbCBzZWUgdGhlIG5ldyB2YWx1ZS4KPiA+Cj4gPiBUaGUgcHJvYmxlbSBp
cyBub3QgZGlzYWJsZWQgYnV0IHRoZSBlbmFibGUuCj4KPiBTbyBhIG1pc2JlaGF2aW5nIGRldmlj
ZSBjYW4gbG9zZSBpbnRlcnJ1cHRzPyBUaGF0J3Mgbm90IGEgcHJvYmxlbSBhdCBhbGwKPiBpbW8u
CgpJdCdzIHRoZSBpbnRlcnJ1cHQgcmFpc2VkIGJlZm9yZSBzZXR0aW5nIGlycV9zb2Z0X2VuYWJs
ZWQgdG8gdHJ1ZToKCkNQVSAwIHByb2JlKSBkcml2ZXIgc3BlY2lmaWMgc2V0dXAgKG5vdCBjb21t
aXRlZCkKQ1BVIDEgSVJRIGhhbmRsZXIpIHJlYWQgdGhlIHVuaW5pdGlhbGl6ZWQgdmFyaWFibGUK
Q1BVIDAgcHJvYmUpIHNldCBpcnFfc29mdF9lbmFibGVkIHRvIHRydWUKQ1BVIDEgSVJRIGhhbmRs
ZXIpIHJlYWQgaXJxX3NvZnRfZW5hYmxlIGFzIHRydWUKQ1BVIDEgSVJRIGhhbmRsZXIpIHVzZSB0
aGUgdW5pbml0aWFsaXplZCB2YXJpYWJsZQoKVGhhbmtzCgo+Cj4gPiBXZSB1c2Ugc21wX3N0b3Jl
X3JlbGFzZSgpCj4gPiB0byBtYWtlIHN1cmUgdGhlIGRyaXZlciBjb21taXRzIHRoZSBzZXR1cCBi
ZWZvcmUgZW5hYmxpbmcgdGhlIGlycS4gSXQKPiA+IG1lYW5zIHRoZSByZWFkIG5lZWRzIHRvIGJl
IG9yZGVyZWQgYXMgd2VsbCBpbiB2cmluZ19pbnRlcnJ1cHQoKS4KPiA+Cj4gPiA+Cj4gPiA+IEFs
dGhvdWdoIEkgY291bGRuJ3QgZmluZCBhbnl0aGluZyBhYm91dCB0aGlzIGluIG1lbW9yeS1iYXJy
aWVycy50eHQKPiA+ID4gd2hpY2ggc3VycHJpc2VzIG1lLgo+ID4gPgo+ID4gPiBDQyBQYXVsIHRv
IGhlbHAgbWFrZSBzdXJlIEknbSByaWdodC4KPiA+ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gVG8gYXZvaWQgYnJlYWtpbmcgbGVnYWN5IGRldmljZSB3aGljaCBjYW4gc2Vu
ZCBJUlEgYmVmb3JlIERSSVZFUl9PSywgYQo+ID4gPiA+ID4gPiBtb2R1bGUgcGFyYW1ldGVyIGlz
IGludHJvZHVjZWQgdG8gZW5hYmxlIHRoZSBoYXJkZW5pbmcgc28gZnVuY3Rpb24KPiA+ID4gPiA+
ID4gaGFyZGVuaW5nIGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQuCj4gPiA+ID4gPiBXaGljaCBkZXZp
Y2VzIGFyZSB0aGVzZT8gSG93IGNvbWUgdGhleSBzZW5kIGFuIGludGVycnVwdCBiZWZvcmUgdGhl
cmUKPiA+ID4gPiA+IGFyZSBhbnkgYnVmZmVycyBpbiBhbnkgcXVldWVzPwo+ID4gPiA+Cj4gPiA+
ID4KPiA+ID4gPiBJIGNvcGllZCB0aGlzIGZyb20gdGhlIGNvbW1pdCBsb2cgZm9yIDIyYjcwNTBh
MDI0ZDcKPiA+ID4gPgo+ID4gPiA+ICIKPiA+ID4gPgo+ID4gPiA+ICAgICBUaGlzIGNoYW5nZSB3
aWxsIGFsc28gYmVuZWZpdCBvbGQgaHlwZXJ2aXNvcnMgKGJlZm9yZSAyMDA5KQo+ID4gPiA+ICAg
ICB0aGF0IHNlbmQgaW50ZXJydXB0cyB3aXRob3V0IGNoZWNraW5nIERSSVZFUl9PSzogcHJldmlv
dXNseSwKPiA+ID4gPiAgICAgdGhlIGNhbGxiYWNrIGNvdWxkIHJhY2Ugd2l0aCBkcml2ZXItc3Bl
Y2lmaWMgaW5pdGlhbGl6YXRpb24uCj4gPiA+ID4gIgo+ID4gPiA+Cj4gPiA+ID4gSWYgdGhpcyBp
cyBvbmx5IGZvciBjb25maWcgaW50ZXJydXB0LCBJIGNhbiByZW1vdmUgdGhlIGFib3ZlIGxvZy4K
PiA+ID4KPiA+ID4KPiA+ID4gVGhpcyBpcyBvbmx5IGZvciBjb25maWcgaW50ZXJydXB0Lgo+ID4K
PiA+IE9rLgo+ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gTm90ZSB0aGF0
IHRoZSBoYXJkZW5pbmcgaXMgb25seSBkb25lIGZvciB2cmluZyBpbnRlcnJ1cHQgc2luY2UgdGhl
Cj4gPiA+ID4gPiA+IGNvbmZpZyBpbnRlcnJ1cHQgaGFyZGVuaW5nIGlzIGFscmVhZHkgZG9uZSBp
biBjb21taXQgMjJiNzA1MGEwMjRkNwo+ID4gPiA+ID4gPiAoInZpcnRpbzogZGVmZXIgY29uZmln
IGNoYW5nZWQgbm90aWZpY2F0aW9ucyIpLiBCdXQgdGhlIG1ldGhvZCB0aGF0IGlzCj4gPiA+ID4g
PiA+IHVzZWQgYnkgY29uZmlnIGludGVycnVwdCBjYW4ndCBiZSByZXVzZWQgYnkgdGhlIHZyaW5n
IGludGVycnVwdAo+ID4gPiA+ID4gPiBoYW5kbGVyIGJlY2F1c2UgaXQgdXNlcyBzcGlubG9jayB0
byBkbyB0aGUgc3luY2hyb25pemF0aW9uIHdoaWNoIGlzCj4gPiA+ID4gPiA+IGV4cGVuc2l2ZS4K
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dh
bmdAcmVkaGF0LmNvbT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiAgIGRy
aXZlcnMvdmlydGlvL3ZpcnRpby5jICAgICAgIHwgMTkgKysrKysrKysrKysrKysrKysrKwo+ID4g
PiA+ID4gPiAgIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19yaW5nLmMgIHwgIDkgKysrKysrKystCj4g
PiA+ID4gPiA+ICAgaW5jbHVkZS9saW51eC92aXJ0aW8uaCAgICAgICAgfCAgNCArKysrCj4gPiA+
ID4gPiA+ICAgaW5jbHVkZS9saW51eC92aXJ0aW9fY29uZmlnLmggfCAyNSArKysrKysrKysrKysr
KysrKysrKysrKysrCj4gPiA+ID4gPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZpcnRpby92aXJ0aW8uYyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpby5jCj4gPiA+ID4g
PiA+IGluZGV4IDhkZGU0NGVhMDQ0YS4uODVlMzMxZWZhOWNjIDEwMDY0NAo+ID4gPiA+ID4gPiAt
LS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW8uYwo+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3Zp
cnRpby92aXJ0aW8uYwo+ID4gPiA+ID4gPiBAQCAtNyw2ICs3LDEyIEBACj4gPiA+ID4gPiA+ICAg
I2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gPiA+ID4gPiA+ICAgI2luY2x1ZGUgPHVhcGkvbGludXgv
dmlydGlvX2lkcy5oPgo+ID4gPiA+ID4gPiArc3RhdGljIGJvb2wgaXJxX2hhcmRlbmluZyA9IGZh
bHNlOwo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICttb2R1bGVfcGFyYW0oaXJxX2hhcmRlbmlu
ZywgYm9vbCwgMDQ0NCk7Cj4gPiA+ID4gPiA+ICtNT0RVTEVfUEFSTV9ERVNDKGlycV9oYXJkZW5p
bmcsCj4gPiA+ID4gPiA+ICsgICAgICAgICAgIkRpc2FsYmUgSVJRIHNvZnR3YXJlIHByb2Nlc3Np
bmcgd2hlbiBpdCBpcyBub3QgZXhwZWN0ZWQiKTsKPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiAg
IC8qIFVuaXF1ZSBudW1iZXJpbmcgZm9yIHZpcnRpbyBkZXZpY2VzLiAqLwo+ID4gPiA+ID4gPiAg
IHN0YXRpYyBERUZJTkVfSURBKHZpcnRpb19pbmRleF9pZGEpOwo+ID4gPiA+ID4gPiBAQCAtMjIw
LDYgKzIyNiwxNSBAQCBzdGF0aWMgaW50IHZpcnRpb19mZWF0dXJlc19vayhzdHJ1Y3QgdmlydGlv
X2RldmljZSAqZGV2KQo+ID4gPiA+ID4gPiAgICAqICovCj4gPiA+ID4gPiA+ICAgdm9pZCB2aXJ0
aW9fcmVzZXRfZGV2aWNlKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICpkZXYpCj4gPiA+ID4gPiA+ICAg
ewo+ID4gPiA+ID4gPiArIC8qCj4gPiA+ID4gPiA+ICsgICogVGhlIGJlbG93IHN5bmNocm9uaXpl
X3JjdSgpIGd1YXJhbnRlZXMgdGhhdCBhbnkKPiA+ID4gPiA+ID4gKyAgKiBpbnRlcnJ1cHQgZm9y
IHRoaXMgbGluZSBhcnJpdmluZyBhZnRlcgo+ID4gPiA+ID4gPiArICAqIHN5bmNocm9uaXplX3Jj
dSgpIGhhcyBjb21wbGV0ZWQgaXMgZ3VhcmFudGVlZCB0byBzZWUKPiA+ID4gPiA+ID4gKyAgKiBp
cnFfc29mdF9lbmFibGVkID09IGZhbHNlLgo+ID4gPiA+ID4gTmV3cyB0byBtZSBJIGRpZCBub3Qg
a25vdyBzeW5jaHJvbml6ZV9yY3UgaGFzIGFueXRoaW5nIHRvIGRvCj4gPiA+ID4gPiB3aXRoIGlu
dGVycnVwdHMuIERpZCBub3QgeW91IGludGVuZCB0byB1c2Ugc3luY2hyb25pemVfaXJxPwo+ID4g
PiA+ID4gSSBhbSBub3QgZXZlbiAxMDAlIHN1cmUgc3luY2hyb25pemVfcmN1IGlzIGJ5IGRlc2ln
biBhIG1lbW9yeSBiYXJyaWVyCj4gPiA+ID4gPiB0aG91Z2ggaXQncyBtb3N0IGxpa2VseSBpcyAu
Li4KPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gQWNjb3JkaW5nIHRvIHRoZSBjb21tZW50IGFib3Zl
IHRyZWUgUkNVIHZlcnNpb24gb2Ygc3luY2hyb25pemVfcmN1KCk6Cj4gPiA+ID4KPiA+ID4gPiAi
IiIKPiA+ID4gPgo+ID4gPiA+ICAqIFJDVSByZWFkLXNpZGUgY3JpdGljYWwgc2VjdGlvbnMgYXJl
IGRlbGltaXRlZCBieSByY3VfcmVhZF9sb2NrKCkKPiA+ID4gPiAgKiBhbmQgcmN1X3JlYWRfdW5s
b2NrKCksIGFuZCBtYXkgYmUgbmVzdGVkLiAgSW4gYWRkaXRpb24sIGJ1dCBvbmx5IGluCj4gPiA+
ID4gICogdjUuMCBhbmQgbGF0ZXIsIHJlZ2lvbnMgb2YgY29kZSBhY3Jvc3Mgd2hpY2ggaW50ZXJy
dXB0cywgcHJlZW1wdGlvbiwKPiA+ID4gPiAgKiBvciBzb2Z0aXJxcyBoYXZlIGJlZW4gZGlzYWJs
ZWQgYWxzbyBzZXJ2ZSBhcyBSQ1UgcmVhZC1zaWRlIGNyaXRpY2FsCj4gPiA+ID4gICogc2VjdGlv
bnMuICBUaGlzIGluY2x1ZGVzIGhhcmR3YXJlIGludGVycnVwdCBoYW5kbGVycywgc29mdGlycSBo
YW5kbGVycywKPiA+ID4gPiAgKiBhbmQgTk1JIGhhbmRsZXJzLgo+ID4gPiA+ICIiIgo+ID4gPiA+
Cj4gPiA+ID4gU28gaW50ZXJydXB0IGhhbmRsZXJzIGFyZSB0cmVhdGVkIGFzIHJlYWQtc2lkZSBj
cml0aWNhbCBzZWN0aW9ucy4KPiA+ID4gPgo+ID4gPiA+IEFuZCBpdCBoYXMgdGhlIGNvbW1lbnQg
Zm9yIGV4cGxhaW4gdGhlIGJhcnJpZXI6Cj4gPiA+ID4KPiA+ID4gPiAiIiIKPiA+ID4gPgo+ID4g
PiA+ICAqIE5vdGUgdGhhdCB0aGlzIGd1YXJhbnRlZSBpbXBsaWVzIGZ1cnRoZXIgbWVtb3J5LW9y
ZGVyaW5nIGd1YXJhbnRlZXMuCj4gPiA+ID4gICogT24gc3lzdGVtcyB3aXRoIG1vcmUgdGhhbiBv
bmUgQ1BVLCB3aGVuIHN5bmNocm9uaXplX3JjdSgpIHJldHVybnMsCj4gPiA+ID4gICogZWFjaCBD
UFUgaXMgZ3VhcmFudGVlZCB0byBoYXZlIGV4ZWN1dGVkIGEgZnVsbCBtZW1vcnkgYmFycmllciBz
aW5jZQo+ID4gPiA+ICAqIHRoZSBlbmQgb2YgaXRzIGxhc3QgUkNVIHJlYWQtc2lkZSBjcml0aWNh
bCBzZWN0aW9uIHdob3NlIGJlZ2lubmluZwo+ID4gPiA+ICAqIHByZWNlZGVkIHRoZSBjYWxsIHRv
IHN5bmNocm9uaXplX3JjdSgpLiAgSW4gYWRkaXRpb24sIGVhY2ggQ1BVIGhhdmluZwo+ID4gPiA+
ICIiIgo+ID4gPiA+Cj4gPiA+ID4gU28gb24gU01QIGl0IHByb3ZpZGVzIGEgZnVsbCBiYXJyaWVy
LiBBbmQgZm9yIFVQL3RpbnkgUkNVIHdlIGRvbid0IG5lZWQgdGhlCj4gPiA+ID4gYmFycmllciwg
aWYgdGhlIGludGVycnVwdCBjb21lIGFmdGVyIFdSSVRFX09OQ0UoKSBpdCB3aWxsIHNlZSB0aGUK
PiA+ID4gPiBpcnFfc29mdF9lbmFibGVkIGFzIGZhbHNlLgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFlv
dSBhcmUgcmlnaHQuIFNvIHRoZW4KPiA+ID4gMS4gSSBkbyBub3QgdGhpbmsgd2UgbmVlZCBsb2Fk
X2FjcXVpcmUgLSB3aHkgaXMgaXQgbmVlZGVkPyBKdXN0Cj4gPiA+ICAgIFJFQURfT05DRSBzaG91
bGQgZG8uCj4gPgo+ID4gU2VlIGFib3ZlLgo+ID4KPiA+ID4gMi4gaXNuJ3Qgc3luY2hyb25pemVf
aXJxIGFsc28gZG9pbmcgdGhlIHNhbWUgdGhpbmc/Cj4gPgo+ID4KPiA+IFllcywgYnV0IGl0IHJl
cXVpcmVzIGEgY29uZmlnIG9wcyBzaW5jZSB0aGUgSVJRIGtub3dsZWRnZSBpcyB0cmFuc3BvcnQg
c3BlY2lmaWMuCj4gPgo+ID4gPgo+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gKyAgKi8KPiA+
ID4gPiA+ID4gKyBXUklURV9PTkNFKGRldi0+aXJxX3NvZnRfZW5hYmxlZCwgZmFsc2UpOwo+ID4g
PiA+ID4gPiArIHN5bmNocm9uaXplX3JjdSgpOwo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICAg
ICAgICAgICBkZXYtPmNvbmZpZy0+cmVzZXQoZGV2KTsKPiA+ID4gPiA+ID4gICB9Cj4gPiA+ID4g
PiA+ICAgRVhQT1JUX1NZTUJPTF9HUEwodmlydGlvX3Jlc2V0X2RldmljZSk7Cj4gPiA+ID4gPiBQ
bGVhc2UgYWRkIGNvbW1lbnQgZXhwbGFpbmluZyB3aGVyZSBpdCB3aWxsIGJlIGVuYWJsZWQuCj4g
PiA+ID4gPiBBbHNvLCB3ZSAqcmVhbGx5KiBkb24ndCBuZWVkIHRvIHN5bmNoIGlmIGl0IHdhcyBh
bHJlYWR5IGRpc2FibGVkLAo+ID4gPiA+ID4gbGV0J3Mgbm90IGFkZCB1c2VsZXNzIG92ZXJoZWFk
IHRvIHRoZSBib290IHNlcXVlbmNlLgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBPay4KPiA+ID4g
Pgo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQEAgLTQyNyw2ICs0NDIs
MTAgQEAgaW50IHJlZ2lzdGVyX3ZpcnRpb19kZXZpY2Uoc3RydWN0IHZpcnRpb19kZXZpY2UgKmRl
dikKPiA+ID4gPiA+ID4gICAgICAgICAgIHNwaW5fbG9ja19pbml0KCZkZXYtPmNvbmZpZ19sb2Nr
KTsKPiA+ID4gPiA+ID4gICAgICAgICAgIGRldi0+Y29uZmlnX2VuYWJsZWQgPSBmYWxzZTsKPiA+
ID4gPiA+ID4gICAgICAgICAgIGRldi0+Y29uZmlnX2NoYW5nZV9wZW5kaW5nID0gZmFsc2U7Cj4g
PiA+ID4gPiA+ICsgZGV2LT5pcnFfc29mdF9jaGVjayA9IGlycV9oYXJkZW5pbmc7Cj4gPiA+ID4g
PiA+ICsKPiA+ID4gPiA+ID4gKyBpZiAoZGV2LT5pcnFfc29mdF9jaGVjaykKPiA+ID4gPiA+ID4g
KyAgICAgICAgIGRldl9pbmZvKCZkZXYtPmRldiwgIklSUSBoYXJkZW5pbmcgaXMgZW5hYmxlZFxu
Iik7Cj4gPiA+ID4gPiA+ICAgICAgICAgICAvKiBXZSBhbHdheXMgc3RhcnQgYnkgcmVzZXR0aW5n
IHRoZSBkZXZpY2UsIGluIGNhc2UgYSBwcmV2aW91cwo+ID4gPiA+ID4gPiAgICAgICAgICAgICog
ZHJpdmVyIG1lc3NlZCBpdCB1cC4gIFRoaXMgYWxzbyB0ZXN0cyB0aGF0IGNvZGUgcGF0aCBhIGxp
dHRsZS4gKi8KPiA+ID4gPiA+IG9uZSBvZiB0aGUgcG9pbnRzIG9mIGhhcmRlbmluZyBpcyBpdCdz
IGFsc28gaGVscGZ1bCBmb3IgYnVnZ3kKPiA+ID4gPiA+IGRldmljZXMuIHRoaXMgZmxhZyBkZWZl
YXRzIHRoZSBwdXJwb3NlLgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBEbyB5b3UgbWVhbjoKPiA+
ID4gPgo+ID4gPiA+IDEpIHdlIG5lZWQgc29tZXRoaW5nIGxpa2UgY29uZmlnX2VuYWJsZT8gVGhp
cyBzZWVtcyBub3QgZWFzeSB0byBiZQo+ID4gPiA+IGltcGxlbWVudGVkIHdpdGhvdXQgb2J2aW91
cyBvdmVyaGVhZCwgbWFpbmx5IHRoZSBzeW5jaHJvbml6ZSB3aXRoIHRoZQo+ID4gPiA+IGludGVy
cnVwdCBoYW5kbGVycwo+ID4gPgo+ID4gPiBCdXQgc3luY2hyb25pemUgaXMgb25seSBvbiB0ZWFy
LWRvd24gcGF0aC4gVGhhdCBpcyBub3QgY3JpdGljYWwgZm9yIGFueQo+ID4gPiB1c2VycyBhdCB0
aGUgbW9tZW50LCBldmVuIGxlc3MgdGhhbiBwcm9iZS4KPiA+Cj4gPiBJIG1lYW50IGlmIHdlIGhh
dmUgdnEtPmlycV9wZW5kaW5nLCB3ZSBuZWVkIHRvIGNhbGwgdnJpbmdfaW50ZXJydXB0KCkKPiA+
IGluIHRoZSB2aXJ0aW9fZGV2aWNlX3JlYWR5KCkgYW5kIHN5bmNocm9uaXplIHRoZSBJUlEgaGFu
ZGxlcnMgd2l0aAo+ID4gc3BpbmxvY2sgb3Igb3RoZXJzLgo+ID4KPiA+ID4KPiA+ID4gPiAyKSBl
bmFibGUgdGhpcyBieSBkZWZhdWx0LCBzbyBJIGRvbid0IG9iamVjdCwgYnV0IHRoaXMgbWF5IGhh
dmUgc29tZSByaXNrCj4gPiA+ID4gZm9yIG9sZCBoeXBlcnZpc29ycwo+ID4gPgo+ID4gPgo+ID4g
PiBUaGUgcmlzayBpZiB0aGVyZSdzIGEgZHJpdmVyIGFkZGluZyBidWZmZXJzIHdpdGhvdXQgc2V0
dGluZyBEUklWRVJfT0suCj4gPgo+ID4gUHJvYmFibHkgbm90LCB3ZSBoYXZlIGRldmljZXMgdGhh
dCBhY2NlcHQgcmFuZG9tIGlucHV0cyBmcm9tIG91dHNpZGUsCj4gPiBuZXQsIGNvbnNvbGUsIGlu
cHV0IGV0Yy4gSSd2ZSBkb25lIGEgcm91bmQgb2YgYXVkaXRzIG9mIHRoZSBRZW11Cj4gPiBjb2Rl
cy4gVGhleSBsb29rIGFsbCBmaW5lIHNpbmNlIGRheTAuCj4gPgo+ID4gPiBTbyB3aXRoIHRoaXMg
YXBwcm9hY2gsIGhvdyBhYm91dCB3ZSByZW5hbWUgdGhlIGZsYWcgImRyaXZlcl9vayI/Cj4gPiA+
IEFuZCB0aGVuIGFkZF9idWYgY2FuIGFjdHVhbGx5IHRlc3QgaXQgYW5kIEJVR19PTiBpZiBub3Qg
dGhlcmUgIChhdCBsZWFzdAo+ID4gPiBpbiB0aGUgZGVidWcgYnVpbGQpLgo+ID4KPiA+IFRoaXMg
bG9va3MgbGlrZSBhIGhhcmRlbmluZyBvZiB0aGUgZHJpdmVyIGluIHRoZSBjb3JlIGluc3RlYWQg
b2YgdGhlCj4gPiBkZXZpY2UuIEkgdGhpbmsgaXQgY2FuIGJlIGRvbmUgYnV0IGluIGEgc2VwYXJh
dGUgc2VyaWVzLgo+ID4KPiA+ID4KPiA+ID4gQW5kIGdvaW5nIGRvd24gZnJvbSB0aGVyZSwgaG93
IGFib3V0IHdlIGNhY2hlIHN0YXR1cyBpbiB0aGUKPiA+ID4gZGV2aWNlPyBUaGVuIHdlIGRvbid0
IG5lZWQgdG8ga2VlcCByZS1yZWFkaW5nIGl0IGV2ZXJ5IHRpbWUsCj4gPiA+IHNwZWVkaW5nIGJv
b3QgdXAgYSB0aW55IGJpdC4KPiA+Cj4gPiBJIGRvbid0IGZ1bGx5IHVuZGVyc3RhbmQgaGVyZSwg
YWN0dWFsbHkgc3BlYyByZXF1aXJlcyBzdGF0dXMgdG8gYmUKPiA+IHJlYWQgYmFjayBmb3IgdmFs
aWRhdGlvbiBpbiBtYW55IGNhc2VzLgo+ID4KPiA+IFRoYW5rcwo+ID4KPiA+ID4KPiA+ID4gPgo+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19y
aW5nLmMgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gPiA+ID4gPiA+IGluZGV4IDk2
MmYxNDc3YjFmYS4uMDE3MGY4Yzc4NGQ4IDEwMDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJz
L3ZpcnRpby92aXJ0aW9fcmluZy5jCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3Zp
cnRpb19yaW5nLmMKPiA+ID4gPiA+ID4gQEAgLTIxNDQsMTAgKzIxNDQsMTcgQEAgc3RhdGljIGlu
bGluZSBib29sIG1vcmVfdXNlZChjb25zdCBzdHJ1Y3QgdnJpbmdfdmlydHF1ZXVlICp2cSkKPiA+
ID4gPiA+ID4gICAgICAgICAgIHJldHVybiB2cS0+cGFja2VkX3JpbmcgPyBtb3JlX3VzZWRfcGFj
a2VkKHZxKSA6IG1vcmVfdXNlZF9zcGxpdCh2cSk7Cj4gPiA+ID4gPiA+ICAgfQo+ID4gPiA+ID4g
PiAtaXJxcmV0dXJuX3QgdnJpbmdfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKl92cSkKPiA+ID4g
PiA+ID4gK2lycXJldHVybl90IHZyaW5nX2ludGVycnVwdChpbnQgaXJxLCB2b2lkICp2KQo+ID4g
PiA+ID4gPiAgIHsKPiA+ID4gPiA+ID4gKyBzdHJ1Y3QgdmlydHF1ZXVlICpfdnEgPSB2Owo+ID4g
PiA+ID4gPiArIHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2ID0gX3ZxLT52ZGV2Owo+ID4gPiA+
ID4gPiAgICAgICAgICAgc3RydWN0IHZyaW5nX3ZpcnRxdWV1ZSAqdnEgPSB0b192dnEoX3ZxKTsK
PiA+ID4gPiA+ID4gKyBpZiAoIXZpcnRpb19pcnFfc29mdF9lbmFibGVkKHZkZXYpKSB7Cj4gPiA+
ID4gPiA+ICsgICAgICAgICBkZXZfd2Fybl9vbmNlKCZ2ZGV2LT5kZXYsICJ2aXJ0aW8gdnJpbmcg
SVJRIHJhaXNlZCBiZWZvcmUgRFJJVkVSX09LIik7Cj4gPiA+ID4gPiA+ICsgICAgICAgICByZXR1
cm4gSVJRX05PTkU7Cj4gPiA+ID4gPiA+ICsgfQo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICAg
ICAgICAgICBpZiAoIW1vcmVfdXNlZCh2cSkpIHsKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgcHJfZGVidWcoInZpcnRxdWV1ZSBpbnRlcnJ1cHQgd2l0aCBubyB3b3JrIGZvciAlcFxuIiwg
dnEpOwo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICByZXR1cm4gSVJRX05PTkU7Cj4gPiA+
ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3ZpcnRpby5oIGIvaW5jbHVkZS9saW51
eC92aXJ0aW8uaAo+ID4gPiA+ID4gPiBpbmRleCA1NDY0ZjM5ODkxMmEuLjk1N2Q2YWQ2MDRhYyAx
MDA2NDQKPiA+ID4gPiA+ID4gLS0tIGEvaW5jbHVkZS9saW51eC92aXJ0aW8uaAo+ID4gPiA+ID4g
PiArKysgYi9pbmNsdWRlL2xpbnV4L3ZpcnRpby5oCj4gPiA+ID4gPiA+IEBAIC05NSw2ICs5NSw4
IEBAIGRtYV9hZGRyX3QgdmlydHF1ZXVlX2dldF91c2VkX2FkZHIoc3RydWN0IHZpcnRxdWV1ZSAq
dnEpOwo+ID4gPiA+ID4gPiAgICAqIEBmYWlsZWQ6IHNhdmVkIHZhbHVlIGZvciBWSVJUSU9fQ09O
RklHX1NfRkFJTEVEIGJpdCAoZm9yIHJlc3RvcmUpCj4gPiA+ID4gPiA+ICAgICogQGNvbmZpZ19l
bmFibGVkOiBjb25maWd1cmF0aW9uIGNoYW5nZSByZXBvcnRpbmcgZW5hYmxlZAo+ID4gPiA+ID4g
PiAgICAqIEBjb25maWdfY2hhbmdlX3BlbmRpbmc6IGNvbmZpZ3VyYXRpb24gY2hhbmdlIHJlcG9y
dGVkIHdoaWxlIGRpc2FibGVkCj4gPiA+ID4gPiA+ICsgKiBAaXJxX3NvZnRfY2hlY2s6IHdoZXRo
ZXIgb3Igbm90IHRvIGNoZWNrIEBpcnFfc29mdF9lbmFibGVkCj4gPiA+ID4gPiA+ICsgKiBAaXJx
X3NvZnRfZW5hYmxlZDogY2FsbGJhY2tzIGVuYWJsZWQKPiA+ID4gPiA+ID4gICAgKiBAY29uZmln
X2xvY2s6IHByb3RlY3RzIGNvbmZpZ3VyYXRpb24gY2hhbmdlIHJlcG9ydGluZwo+ID4gPiA+ID4g
PiAgICAqIEBkZXY6IHVuZGVybHlpbmcgZGV2aWNlLgo+ID4gPiA+ID4gPiAgICAqIEBpZDogdGhl
IGRldmljZSB0eXBlIGlkZW50aWZpY2F0aW9uICh1c2VkIHRvIG1hdGNoIGl0IHdpdGggYSBkcml2
ZXIpLgo+ID4gPiA+ID4gPiBAQCAtMTA5LDYgKzExMSw4IEBAIHN0cnVjdCB2aXJ0aW9fZGV2aWNl
IHsKPiA+ID4gPiA+ID4gICAgICAgICAgIGJvb2wgZmFpbGVkOwo+ID4gPiA+ID4gPiAgICAgICAg
ICAgYm9vbCBjb25maWdfZW5hYmxlZDsKPiA+ID4gPiA+ID4gICAgICAgICAgIGJvb2wgY29uZmln
X2NoYW5nZV9wZW5kaW5nOwo+ID4gPiA+ID4gPiArIGJvb2wgaXJxX3NvZnRfY2hlY2s7Cj4gPiA+
ID4gPiA+ICsgYm9vbCBpcnFfc29mdF9lbmFibGVkOwo+ID4gPiA+ID4gPiAgICAgICAgICAgc3Bp
bmxvY2tfdCBjb25maWdfbG9jazsKPiA+ID4gPiA+ID4gICAgICAgICAgIHNwaW5sb2NrX3QgdnFz
X2xpc3RfbG9jazsgLyogUHJvdGVjdHMgVlFzIGxpc3QgYWNjZXNzICovCj4gPiA+ID4gPiA+ICAg
ICAgICAgICBzdHJ1Y3QgZGV2aWNlIGRldjsKPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvdmlydGlvX2NvbmZpZy5oIGIvaW5jbHVkZS9saW51eC92aXJ0aW9fY29uZmlnLmgK
PiA+ID4gPiA+ID4gaW5kZXggZGFmZGM3ZjQ4YzAxLi45YzFiNjFmMmU1MjUgMTAwNjQ0Cj4gPiA+
ID4gPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvdmlydGlvX2NvbmZpZy5oCj4gPiA+ID4gPiA+ICsr
KyBiL2luY2x1ZGUvbGludXgvdmlydGlvX2NvbmZpZy5oCj4gPiA+ID4gPiA+IEBAIC0xNzQsNiAr
MTc0LDI0IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB2aXJ0aW9faGFzX2ZlYXR1cmUoY29uc3Qgc3Ry
dWN0IHZpcnRpb19kZXZpY2UgKnZkZXYsCj4gPiA+ID4gPiA+ICAgICAgICAgICByZXR1cm4gX192
aXJ0aW9fdGVzdF9iaXQodmRldiwgZmJpdCk7Cj4gPiA+ID4gPiA+ICAgfQo+ID4gPiA+ID4gPiAr
LyoKPiA+ID4gPiA+ID4gKyAqIHZpcnRpb19pcnFfc29mdF9lbmFibGVkOiB3aGV0aGVyIHdlIGNh
biBleGVjdXRlIGNhbGxiYWNrcwo+ID4gPiA+ID4gPiArICogQHZkZXY6IHRoZSBkZXZpY2UKPiA+
ID4gPiA+ID4gKyAqLwo+ID4gPiA+ID4gPiArc3RhdGljIGlubGluZSBib29sIHZpcnRpb19pcnFf
c29mdF9lbmFibGVkKGNvbnN0IHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+ID4gPiA+ID4g
PiArewo+ID4gPiA+ID4gPiArIGlmICghdmRldi0+aXJxX3NvZnRfY2hlY2spCj4gPiA+ID4gPiA+
ICsgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArIC8qCj4g
PiA+ID4gPiA+ICsgICogUmVhZCBpcnFfc29mdF9lbmFibGVkIGJlZm9yZSByZWFkaW5nIG90aGVy
IGRldmljZSBzcGVjaWZpYwo+ID4gPiA+ID4gPiArICAqIGRhdGEuIFBhcmllZCB3aXRoIHNtcF9z
dG9yZV9yZWxhc2UoKSBpbgo+ID4gPiA+ID4gcGFpcmVkCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+
IFdpbGwgZml4Lgo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gKyAgKiB2aXJ0aW9fZGV2aWNlX3JlYWR5KCkgYW5kIFdSSVRFX09OQ0Uo
KS9zeW5jaHJvbml6ZV9yY3UoKSBpbgo+ID4gPiA+ID4gPiArICAqIHZpcnRpb19yZXNldF9kZXZp
Y2UoKS4KPiA+ID4gPiA+ID4gKyAgKi8KPiA+ID4gPiA+ID4gKyByZXR1cm4gc21wX2xvYWRfYWNx
dWlyZSgmdmRldi0+aXJxX3NvZnRfZW5hYmxlZCk7Cj4gPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ID4gICAvKioKPiA+ID4gPiA+ID4gICAgKiB2aXJ0aW9faGFzX2RtYV9xdWly
ayAtIGRldGVybWluZSB3aGV0aGVyIHRoaXMgZGV2aWNlIGhhcyB0aGUgRE1BIHF1aXJrCj4gPiA+
ID4gPiA+ICAgICogQHZkZXY6IHRoZSBkZXZpY2UKPiA+ID4gPiA+ID4gQEAgLTIzNiw2ICsyNTQs
MTMgQEAgdm9pZCB2aXJ0aW9fZGV2aWNlX3JlYWR5KHN0cnVjdCB2aXJ0aW9fZGV2aWNlICpkZXYp
Cj4gPiA+ID4gPiA+ICAgICAgICAgICBpZiAoZGV2LT5jb25maWctPmVuYWJsZV9jYnMpCj4gPiA+
ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgZGV2LT5jb25maWctPmVuYWJsZV9jYnMoZGV2KTsK
PiA+ID4gPiA+ID4gKyAvKgo+ID4gPiA+ID4gPiArICAqIENvbW1pdCB0aGUgZHJpdmVyIHNldHVw
IGJlZm9yZSBlbmFibGluZyB0aGUgdmlydHF1ZXVlCj4gPiA+ID4gPiA+ICsgICogY2FsbGJhY2tz
LiBQYXJpZWQgd2l0aCBzbXBfbG9hZF9hY3VxaXJlKCkgaW4KPiA+ID4gPiA+ID4gKyAgKiB2aXJ0
aW9faXJxX3NvZnRfZW5hYmxlZCgpCj4gPiA+ID4gPiA+ICsgICovCj4gPiA+ID4gPiA+ICsgc21w
X3N0b3JlX3JlbGVhc2UoJmRldi0+aXJxX3NvZnRfZW5hYmxlZCwgdHJ1ZSk7Cj4gPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ID4gICAgICAgICAgIEJVR19PTihzdGF0dXMgJiBWSVJUSU9fQ09ORklHX1Nf
RFJJVkVSX09LKTsKPiA+ID4gPiA+ID4gICAgICAgICAgIGRldi0+Y29uZmlnLT5zZXRfc3RhdHVz
KGRldiwgc3RhdHVzIHwgVklSVElPX0NPTkZJR19TX0RSSVZFUl9PSyk7Cj4gPiA+ID4gPiA+ICAg
fQo+ID4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gPiAyLjI1LjEKPiA+ID4KPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
