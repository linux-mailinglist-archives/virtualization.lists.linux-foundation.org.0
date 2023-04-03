Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD8E6D3CE3
	for <lists.virtualization@lfdr.de>; Mon,  3 Apr 2023 07:28:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F4754052A;
	Mon,  3 Apr 2023 05:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F4754052A
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dVWCgpCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hMsGKl9SbSk5; Mon,  3 Apr 2023 05:28:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 057904058B;
	Mon,  3 Apr 2023 05:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 057904058B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35FB6C0089;
	Mon,  3 Apr 2023 05:28:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 266FEC002F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Apr 2023 05:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DF9D4052B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Apr 2023 05:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DF9D4052B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8VUuuy53gXkP
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Apr 2023 05:28:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCB7140135
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCB7140135
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Apr 2023 05:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680499706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OoV593IeV4OXVCHbXTm/hdMpgDxOBIN4HZw268pF00w=;
 b=dVWCgpCEr03xkifPzzIimx0+l16OWynG1XhUT4/h9mEfc9V66OQrNWMs/58j3DEYoQmYX9
 lkkLyRq5j8O/Z3JUjB0/orermg4n2H0sOCNs43sszUaDsrKZBTLMunXpS7mbJCv3tBExI1
 PjYaTMBrAz15umDlYpR4U/uCuuRlcqk=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-ocCioD0CMjC59lQHFkhQTQ-1; Mon, 03 Apr 2023 01:28:25 -0400
X-MC-Unique: ocCioD0CMjC59lQHFkhQTQ-1
Received: by mail-oo1-f72.google.com with SMTP id
 y132-20020a4a458a000000b0053b6e3c13cfso7279635ooa.12
 for <virtualization@lists.linux-foundation.org>;
 Sun, 02 Apr 2023 22:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680499705; x=1683091705;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OoV593IeV4OXVCHbXTm/hdMpgDxOBIN4HZw268pF00w=;
 b=8Dkvy+OJGl+4DUMmasiwrCDMqvRmwAkHjMEHKFAojXqY0ykZFKFl2omx+R+ZtqHEEz
 TZpEP5rZAmWcwbC5nA50VJ0EYhvtKMYpKbnUj07X8edJ6pHGKytQp4Zh0NKJHdk62ZMZ
 ESeMRICnnthvyk767lNQOtYiWdwwyjVpFlPTpVp6UIn5adw8JgOdGFUxHmOqlGR+F7+y
 q+Ua6kTeG8ge02iUVmu9qB0M/dEwJKWCHYzIhKsPdMrEDM2wIedDCCXQA4woUyKQh6JG
 B4xZdl6nIAmD2DuIV5yIzAFV5+ZGmv8SQNKD1K4Wm1ukxG66wiHXL/DpNuHNEvAeMuYe
 d2KA==
X-Gm-Message-State: AAQBX9cAPcKqvQoNgCxw95EoE85wHdPl4yZGzhk8u0grlYJAOBQfjAMB
 bxIaU9N38l3iCsDlu1BCcPrCsRN533hcR+MSAt74odY2nglLErawoHmNOQwg42UgitTN9YIGm4W
 u3lDAQNjPrppZ9dGK9JGIjJBkMIEh6ZZbyyQIakJSM/3712Ozo0VOiSLCeA==
X-Received: by 2002:a05:6870:8310:b0:177:c2fb:8cec with SMTP id
 p16-20020a056870831000b00177c2fb8cecmr13589512oae.9.1680499704958; 
 Sun, 02 Apr 2023 22:28:24 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Kgn0d1tpGnqFQcBCGJGVwySLYV0VDKz4wjHNbDfaEgwq0nBp48U3QjkH7vyT8wostIrPfkyhMm4uilwgoTl4=
X-Received: by 2002:a05:6870:8310:b0:177:c2fb:8cec with SMTP id
 p16-20020a056870831000b00177c2fb8cecmr13589504oae.9.1680499704742; Sun, 02
 Apr 2023 22:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230331204854.20082-1-lingshan.zhu@intel.com>
In-Reply-To: <20230331204854.20082-1-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 3 Apr 2023 13:28:13 +0800
Message-ID: <CACGkMEstNJ1TJtTApniJLyN872gF9ZpAbj3hEKUw6yX3ZpPiFg@mail.gmail.com>
Subject: Re: [PATCH 0/5] vDPA/ifcvf: implement immediate initialization
 mechanism
To: Zhu Lingshan <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: virtualization@lists.linux-foundation.org, mst@redhat.com
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

T24gRnJpLCBNYXIgMzEsIDIwMjMgYXQgODo0OeKAr1BNIFpodSBMaW5nc2hhbiA8bGluZ3NoYW4u
emh1QGludGVsLmNvbT4gd3JvdGU6Cj4KPiBGb3JtZXJseSwgaWZjdmYgZHJpdmVyIGhhcyBpbXBs
ZW1lbnRlZCBhIGxhenktaW5pdGlhbGl6YXRpb24gbWVjaGFuaXNtCj4gZm9yIHRoZSB2aXJ0cXVl
dWVzIGFuZCBvdGhlciBjb25maWcgc3BhY2UgY29udGVudHMsCj4gaXQgd291bGQgc3RvcmUgYWxs
IGNvbmZpZ3VyYXRpb25zIHRoYXQgcGFzc2VkIGRvd24gZnJvbSB0aGUgdXNlcnNwYWNlLAo+IHRo
ZW4gbG9hZCB0aGVtIHRvIHRoZSBkZXZpY2UgY29uZmlnIHNwYWNlIHVwb24gRFJJVkVSX09LLgo+
Cj4gVGhpcyBjYW4gbm90IHNlcnZlIGxpdmUgbWlncmF0aW9uLCBzbyB0aGlzIHNlcmllcyBpbXBs
ZW1lbnQgYW4KPiBpbW1lZGlhdGUgaW5pdGlhbGl6YXRpb24gbWVjaGFuaXNtLCB3aGljaCBtZWFu
cyByYXRoZXIgdGhhbiB0aGUKPiBmb3JtZXIgc3RvcmUtbG9hZCBwcm9jZXNzLCB0aGUgdmlydGlv
IG9wZXJhdGlvbnMgbGlrZSB2cSBvcHMKPiB3b3VsZCB0YWtlIGltbWVkaWF0ZSBhY3Rpb25zIGJ5
IGFjY2VzcyB0aGUgdmlydGlvIHJlZ2lzdGVycy4KCklzIHRoZXJlIGFueSBjaGFuY2UgdGhhdCBp
ZmN2ZiBjYW4gdXNlIHZpcnRpb19wY2lfbW9kZXJuX2RldiBsaWJyYXJ5PwoKVGhlbiB3ZSBkb24n
dCBuZWVkIHRvIGR1cGxpY2F0ZSB0aGUgY29kZXMuCgpOb3RlIHRoYXQgcGRzX3ZkcGEgd2lsbCBi
ZSB0aGUgc2Vjb25kIHVzZXIgZm9yIHZpcnRpb19wY2lfbW9kZXJuX2RldgpsaWJyYXJ5IChhbmQg
dGhlIGZpcnN0IHZEUEEgcGFyZW50IHRvIHVzZSB0aGF0IGxpYnJhcnkpLgoKVGhhbmtzCgo+Cj4g
VGhpcyBzZXJpZXMgYWxzbyBpbXBsZW1lbnQgaXJxIHN5bmNocm9uaXphdGlvbiBpbiB0aGUgcmVz
ZXQKPiByb3V0aW5lCj4KPiBaaHUgTGluZ3NoYW4gKDUpOgo+ICAgdmlydCBxdWV1ZSBvcHMgdGFr
ZSBpbW1lZGlhdGUgYWN0aW9ucwo+ICAgZ2V0X2RyaXZlcl9mZWF0dXJlcyBmcm9tIHZpcml0byBy
ZWdpc3RlcnMKPiAgIHJldGlyZSBpZmN2Zl9zdGFydF9kYXRhcGF0aCBhbmQgaWZjdmZfYWRkX3N0
YXR1cwo+ICAgc3luY2hyb25pemUgaXJxcyBpbiB0aGUgcmVzZXQgcm91dGluZQo+ICAgYSB2ZW5k
b3IgZHJpdmVyIHNob3VsZCBub3Qgc2V0IF9DT05GSUdfU19GQUlMRUQKPgo+ICBkcml2ZXJzL3Zk
cGEvaWZjdmYvaWZjdmZfYmFzZS5jIHwgMTYyICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tCj4gIGRyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmggfCAgMTYgKystLQo+ICBkcml2
ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jIHwgIDk3ICsrKystLS0tLS0tLS0tLS0tLS0KPiAg
MyBmaWxlcyBjaGFuZ2VkLCAxMjIgaW5zZXJ0aW9ucygrKSwgMTUzIGRlbGV0aW9ucygtKQo+Cj4g
LS0KPiAyLjM5LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
