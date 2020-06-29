Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE2920CFD8
	for <lists.virtualization@lfdr.de>; Mon, 29 Jun 2020 17:52:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 77B4F8928F;
	Mon, 29 Jun 2020 15:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YucESUc6--jo; Mon, 29 Jun 2020 15:52:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BBB758928B;
	Mon, 29 Jun 2020 15:52:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FD0BC016E;
	Mon, 29 Jun 2020 15:52:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7833BC016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 15:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6392E8928B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 15:52:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3HzO08xeOpQS
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 15:52:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0127C88ADF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 15:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593445923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IU9n+aBPLrPIZ0eR9RIDgzyyTwxAS9aWp/34wgBsy4=;
 b=Id6/6NGWUrZ5AHX4/6Yp/MT4xeSr1tUEUI4wrq27AbcxFGpZrrJJraNJ8Im2TSD/6rvHQU
 +FvwvvMdDd4MlyNiar6TI7t15JQbDS1c7FfZjhEOFdDFvT5DjvStUG9tuA1NtNcs5d5Qsp
 YY3gsfi69ywwParTk9C2O8NvLorBgjM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-qomnWOvsN-2Be5IGhJXCpQ-1; Mon, 29 Jun 2020 11:49:59 -0400
X-MC-Unique: qomnWOvsN-2Be5IGhJXCpQ-1
Received: by mail-wm1-f72.google.com with SMTP id o138so17346055wme.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 08:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3IU9n+aBPLrPIZ0eR9RIDgzyyTwxAS9aWp/34wgBsy4=;
 b=OPCfkvxcCuPMcYol9v2jRzCsp6VaaLdSACAi5TyNEiahxzVG3WtDetxvN6MI1UnUzw
 kC8lV4T6qucWBMzBTmmK/HQ+02jdgzszM5n8y8cu5w9Yva8Jq7Wfaoi0/k6KsMuBNGHz
 rDybhueSoE/XeNhck71+tOyslsEsxI3nazfledef1guQMv05/zKj7Tu4RsYhN1KMGlfA
 DQMuWxITw7Tdxw6Fitvdh1VB8Ahj4PUuccZ2mNAlRqnfM51rH9KQs0iwXIiQ3LHiOxZg
 9XJsa+/R3i8xO0aVJh6xT2yXa0Szq/NYE9kMPQNqBlAVQqTf1JR76TkH/5Zff/noZuBD
 L9tw==
X-Gm-Message-State: AOAM533BKAILRIjn2UTU0WMl9dspJjz1/+QQKVzAI5AcNAieFlYM7ifI
 eq/l8D80/5rN2gAaAe48LuJnWPWztSaSh5fAG3CP2Y8MgNd2cqrwNkPHQ7Fhyq6Z86WDEXGjWsB
 rHB2BxUIFD+Ty3UaJFr0bSjM73MDcExRaiLqpJsNVPA==
X-Received: by 2002:adf:c3c7:: with SMTP id d7mr17007234wrg.51.1593445797534; 
 Mon, 29 Jun 2020 08:49:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJCjSJAwuxpGqjFO8XbcXjPLwM+eslVQB6/Vp1ldtVTIGaS9N1k5u+Hb4WCmy87/sBSh2Vvg==
X-Received: by 2002:adf:c3c7:: with SMTP id d7mr17007220wrg.51.1593445797298; 
 Mon, 29 Jun 2020 08:49:57 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 s10sm222118wme.31.2020.06.29.08.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 08:49:56 -0700 (PDT)
Date: Mon, 29 Jun 2020 11:49:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC 4/5] vhost-vdpa: support IOTLB batching hints
Message-ID: <20200629114607-mutt-send-email-mst@kernel.org>
References: <20200618055626.25660-1-jasowang@redhat.com>
 <20200618055626.25660-5-jasowang@redhat.com>
 <20200628054940-mutt-send-email-mst@kernel.org>
 <a2216693-cdba-ff53-46f9-abaf47789f5a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a2216693-cdba-ff53-46f9-abaf47789f5a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: shahafs@mellanox.com, lulu@redhat.com, saugatm@xilinx.com,
 mhabets@solarflare.com, vmireyno@marvell.com, linux-kernel@vger.kernel.org,
 gdawar@xilinx.com, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, hanand@xilinx.com, zhangweining@ruijie.com.cn,
 eli@mellanox.com, lingshan.zhu@intel.com, rob.miller@broadcom.com
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

T24gTW9uLCBKdW4gMjksIDIwMjAgYXQgMDU6MjY6MDNQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvMjgg5LiL5Y2INTo1OCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gVGh1LCBKdW4gMTgsIDIwMjAgYXQgMDE6NTY6MjVQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gVGhpcyBwYXRjaGVzIGV4dGVuZCB0aGUgdmhvc3QgSU9UTEIgQVBJIHRv
IGFjY2VwdCBiYXRjaCB1cGRhdGluZyBoaW50cwo+ID4gPiBmb3JtIHVzZXJzcGFjZS4gV2hlbiB1
c2Vyc3BhY2Ugd2FudHMgdXBkYXRlIHRoZSBkZXZpY2UgSU9UTEIgaW4gYQo+ID4gPiBiYXRjaCwg
aXQgbWF5IGRvOgo+ID4gPiAKPiA+ID4gMSkgV3JpdGUgdmhvc3RfaW90bGJfbXNnIHdpdGggVkhP
U1RfSU9UTEJfQkFUQ0hfQkVHSU4gZmxhZwo+ID4gPiAyKSBQZXJmb3JtIGEgYmF0Y2ggb2YgSU9U
TEIgdXBkYXRpbmcgdmlhIFZIT1NUX0lPVExCX1VQREFURS9JTlZBTElEQVRFCj4gPiA+IDMpIFdy
aXRlIHZob3N0X2lvdGxiX21zZyB3aXRoIFZIT1NUX0lPVExCX0JBVENIX0VORCBmbGFnCj4gPiBB
cyBsb25nIGFzIHdlIGFyZSBleHRlbmRpbmcgdGhlIGludGVyZmFjZSwKPiA+IGlzIHRoZXJlIHNv
bWUgd2F5IHdlIGNvdWxkIGN1dCBkb3duIHRoZSBudW1iZXIgb2Ygc3lzdGVtIGNhbGxzIG5lZWRl
ZAo+ID4gaGVyZT8KPiAKPiAKPiBJJ20gbm90IHN1cmUgaXQncyB3b3J0aCB0byBkbyB0aGF0IHNp
bmNlIHVzdWFsbHkgd2Ugb25seSBoYXZlIGxlc3MgdGhhbiAxMAo+IHJlZ2lvbnMuCgoKV2VsbCB3
aXRoIGEgZ3Vlc3QgaW9tbXUgSSdtIGd1ZXNzaW5nIGl0IGNhbiBnbyB1cCBzaWduaWZpY2FudGx5
LCByaWdodD8KCj4gQSBwb3NzaWJsZSBtZXRob2QgaXMgdG8gY2FycnkgbXVsdGlwbGUgdmhvc3Rf
aW90bGJfbWVzc2FnZSBpbiBvbmUgc3lzdGVtCj4gY2FsbC4KClRoYXQncyBhbiBvcHRpb24uCkFs
c28sIGNhbiBrZXJuZWwgaGFuZGxlIGEgYmF0Y2ggdGhhdCBpcyB0b28gbGFyZ2UgYnkgYXBwbHlp
bmcKcGFydHMgb2YgaXQgaXRlcmF0aXZlbHk/Ck9yIG11c3QgYWxsIGNoYW5nZXMgdGFrZSBwbGFj
ZSBhdG9taWNhbGx5IGFmdGVyIEJBVENIX0VORD8KSWYgYXRvbWljYWxseSwgd2UgbWlnaHQgbmVl
ZCB0byBsaW1pdCBiYXRjaCBzaXplIHRvIG1ha2UKc3VyZSBrZXJuZWwgY2FuIGtlZXAgYSBjb3B5
IGluIG1lbW9yeS4KCgo+IAo+ID4gCj4gPiAKPiA+ID4gVmhvc3QtdmRwYSBtYXkgZGVjaWRlIHRv
IGJhdGNoIHRoZSBJT01NVS9JT1RMQiB1cGRhdGluZyBpbiBzdGVwIDMgd2hlbgo+ID4gPiB2RFBB
IGRldmljZSBzdXBwb3J0IHNldF9tYXAoKSBvcHMuIFRoaXMgaXMgdXNlZnVsIGZvciB0aGUgdkRQ
QSBkZXZpY2UKPiA+ID4gdGhhdCB3YW50IHRvIGtub3cgYWxsIHRoZSBtYXBwaW5ncyB0byB0d2Vh
ayB0aGVpciBvd24gRE1BIHRyYW5zbGF0aW9uCj4gPiA+IGxvZ2ljLgo+ID4gPiAKPiA+ID4gRm9y
IHZEUEEgZGV2aWNlIHRoYXQgZG9lc24ndCByZXF1aXJlIHNldF9tYXAoKSwgbm8gYmVoYXZpb3Ig
Y2hhbmdlcy4KPiA+ID4gCj4gPiA+IFRoaXMgY2FwYWJpbGl0eSBpcyBhZHZlcnRpc2VkIHZpYSBW
SE9TVF9CQUNLRU5EX0ZfSU9UTEJfQkFUQ0ggY2FwYWJpbGl0eS4KPiA+ID4gCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4gPiA+IC0tLQo+ID4g
PiAgIGRyaXZlcnMvdmhvc3QvdmRwYS5jICAgICAgICAgICAgIHwgMzAgKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tCj4gPiA+ICAgaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0LmggICAgICAg
fCAgMiArKwo+ID4gPiAgIGluY2x1ZGUvdWFwaS9saW51eC92aG9zdF90eXBlcy5oIHwgIDcgKysr
KysrKwo+ID4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3ZkcGEuYyBiL2Ry
aXZlcnMvdmhvc3QvdmRwYS5jCj4gPiA+IGluZGV4IDQ1MzA1NzQyMWY4MC4uOGY2MjRiYmFmZWU3
IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+ID4gPiArKysgYi9kcml2
ZXJzL3Zob3N0L3ZkcGEuYwo+ID4gPiBAQCAtNTYsNyArNTYsOSBAQCBlbnVtIHsKPiA+ID4gICB9
Owo+ID4gPiAgIGVudW0gewo+ID4gPiAtCVZIT1NUX1ZEUEFfQkFDS0VORF9GRUFUVVJFUyA9ICgx
VUxMIDw8IFZIT1NUX0JBQ0tFTkRfRl9JT1RMQl9NU0dfVjIpCj4gPiA+ICsJVkhPU1RfVkRQQV9C
QUNLRU5EX0ZFQVRVUkVTID0KPiA+ID4gKwkoMVVMTCA8PCBWSE9TVF9CQUNLRU5EX0ZfSU9UTEJf
TVNHX1YyKSB8Cj4gPiA+ICsJKDFVTEwgPDwgVkhPU1RfQkFDS0VORF9GX0lPVExCX0JBVENIKSwK
PiA+ID4gICB9Owo+ID4gPiAgIC8qIEN1cnJlbnRseSwgb25seSBuZXR3b3JrIGJhY2tlbmQgdy9v
IG11bHRpcXVldWUgaXMgc3VwcG9ydGVkLiAqLwo+ID4gPiBAQCAtNzcsNiArNzksNyBAQCBzdHJ1
Y3Qgdmhvc3RfdmRwYSB7Cj4gPiA+ICAgCWludCB2aXJ0aW9faWQ7Cj4gPiA+ICAgCWludCBtaW5v
cjsKPiA+ID4gICAJc3RydWN0IGV2ZW50ZmRfY3R4ICpjb25maWdfY3R4Owo+ID4gPiArCWludCBp
bl9iYXRjaDsKPiA+ID4gICB9Owo+ID4gPiAgIHN0YXRpYyBERUZJTkVfSURBKHZob3N0X3ZkcGFf
aWRhKTsKPiA+ID4gQEAgLTEyNSw2ICsxMjgsNyBAQCBzdGF0aWMgdm9pZCB2aG9zdF92ZHBhX3Jl
c2V0KHN0cnVjdCB2aG9zdF92ZHBhICp2KQo+ID4gPiAgIAljb25zdCBzdHJ1Y3QgdmRwYV9jb25m
aWdfb3BzICpvcHMgPSB2ZHBhLT5jb25maWc7Cj4gPiA+ICAgCW9wcy0+c2V0X3N0YXR1cyh2ZHBh
LCAwKTsKPiA+ID4gKwl2LT5pbl9iYXRjaCA9IDA7Cj4gPiA+ICAgfQo+ID4gPiAgIHN0YXRpYyBs
b25nIHZob3N0X3ZkcGFfZ2V0X2RldmljZV9pZChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiwgdTggX191
c2VyICphcmdwKQo+ID4gPiBAQCAtNTQwLDkgKzU0NCwxMCBAQCBzdGF0aWMgaW50IHZob3N0X3Zk
cGFfbWFwKHN0cnVjdCB2aG9zdF92ZHBhICp2LAo+ID4gPiAgIAlpZiAob3BzLT5kbWFfbWFwKQo+
ID4gPiAgIAkJciA9IG9wcy0+ZG1hX21hcCh2ZHBhLCBpb3ZhLCBzaXplLCBwYSwgcGVybSk7Cj4g
PiA+IC0JZWxzZSBpZiAob3BzLT5zZXRfbWFwKQo+ID4gPiAtCQlyID0gb3BzLT5zZXRfbWFwKHZk
cGEsIGRldi0+aW90bGIpOwo+ID4gPiAtCWVsc2UKPiA+ID4gKwllbHNlIGlmIChvcHMtPnNldF9t
YXApIHsKPiA+ID4gKwkJaWYgKCF2LT5pbl9iYXRjaCkKPiA+ID4gKwkJCXIgPSBvcHMtPnNldF9t
YXAodmRwYSwgZGV2LT5pb3RsYik7Cj4gPiA+ICsJfSBlbHNlCj4gPiA+ICAgCQlyID0gaW9tbXVf
bWFwKHYtPmRvbWFpbiwgaW92YSwgcGEsIHNpemUsCj4gPiA+ICAgCQkJICAgICAgcGVybV90b19p
b21tdV9mbGFncyhwZXJtKSk7Cj4gPiA+IEBAIC01NTksOSArNTY0LDEwIEBAIHN0YXRpYyB2b2lk
IHZob3N0X3ZkcGFfdW5tYXAoc3RydWN0IHZob3N0X3ZkcGEgKnYsIHU2NCBpb3ZhLCB1NjQgc2l6
ZSkKPiA+ID4gICAJaWYgKG9wcy0+ZG1hX21hcCkKPiA+ID4gICAJCW9wcy0+ZG1hX3VubWFwKHZk
cGEsIGlvdmEsIHNpemUpOwo+ID4gPiAtCWVsc2UgaWYgKG9wcy0+c2V0X21hcCkKPiA+ID4gLQkJ
b3BzLT5zZXRfbWFwKHZkcGEsIGRldi0+aW90bGIpOwo+ID4gPiAtCWVsc2UKPiA+ID4gKwllbHNl
IGlmIChvcHMtPnNldF9tYXApIHsKPiA+ID4gKwkJaWYgKCF2LT5pbl9iYXRjaCkKPiA+ID4gKwkJ
CW9wcy0+c2V0X21hcCh2ZHBhLCBkZXYtPmlvdGxiKTsKPiA+ID4gKwl9IGVsc2UKPiA+ID4gICAJ
CWlvbW11X3VubWFwKHYtPmRvbWFpbiwgaW92YSwgc2l6ZSk7Cj4gPiA+ICAgfQo+ID4gPiBAQCAt
NjU1LDYgKzY2MSw4IEBAIHN0YXRpYyBpbnQgdmhvc3RfdmRwYV9wcm9jZXNzX2lvdGxiX21zZyhz
dHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsCj4gPiA+ICAgCQkJCQlzdHJ1Y3Qgdmhvc3RfaW90bGJfbXNn
ICptc2cpCj4gPiA+ICAgewo+ID4gPiAgIAlzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiA9IGNvbnRhaW5l
cl9vZihkZXYsIHN0cnVjdCB2aG9zdF92ZHBhLCB2ZGV2KTsKPiA+ID4gKwlzdHJ1Y3QgdmRwYV9k
ZXZpY2UgKnZkcGEgPSB2LT52ZHBhOwo+ID4gPiArCWNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19v
cHMgKm9wcyA9IHZkcGEtPmNvbmZpZzsKPiA+ID4gICAJaW50IHIgPSAwOwo+ID4gPiAgIAlyID0g
dmhvc3RfZGV2X2NoZWNrX293bmVyKGRldik7Cj4gPiA+IEBAIC02NjgsNiArNjc2LDE0IEBAIHN0
YXRpYyBpbnQgdmhvc3RfdmRwYV9wcm9jZXNzX2lvdGxiX21zZyhzdHJ1Y3Qgdmhvc3RfZGV2ICpk
ZXYsCj4gPiA+ICAgCWNhc2UgVkhPU1RfSU9UTEJfSU5WQUxJREFURToKPiA+ID4gICAJCXZob3N0
X3ZkcGFfdW5tYXAodiwgbXNnLT5pb3ZhLCBtc2ctPnNpemUpOwo+ID4gPiAgIAkJYnJlYWs7Cj4g
PiA+ICsJY2FzZSBWSE9TVF9JT1RMQl9CQVRDSF9CRUdJTjoKPiA+ID4gKwkJdi0+aW5fYmF0Y2gg
PSB0cnVlOwo+ID4gPiArCQlicmVhazsKPiA+ID4gKwljYXNlIFZIT1NUX0lPVExCX0JBVENIX0VO
RDoKPiA+ID4gKwkJaWYgKHYtPmluX2JhdGNoICYmIG9wcy0+c2V0X21hcCkKPiA+ID4gKwkJCW9w
cy0+c2V0X21hcCh2ZHBhLCBkZXYtPmlvdGxiKTsKPiA+ID4gKwkJdi0+aW5fYmF0Y2ggPSBmYWxz
ZTsKPiA+ID4gKwkJYnJlYWs7Cj4gPiA+ICAgCWRlZmF1bHQ6Cj4gPiA+ICAgCQlyID0gLUVJTlZB
TDsKPiA+ID4gICAJCWJyZWFrOwo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4
L3Zob3N0LmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaAo+ID4gPiBpbmRleCAwYzIzNDk2
MTJlNzcuLjU2NWRhOTZmNTVkNSAxMDA2NDQKPiA+ID4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4
L3Zob3N0LmgKPiA+ID4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0LmgKPiA+ID4gQEAg
LTkxLDYgKzkxLDggQEAKPiA+ID4gICAvKiBVc2UgbWVzc2FnZSB0eXBlIFYyICovCj4gPiA+ICAg
I2RlZmluZSBWSE9TVF9CQUNLRU5EX0ZfSU9UTEJfTVNHX1YyIDB4MQo+ID4gPiArLyogSU9UTEIg
Y2FuIGFjY3BldCBiYXRjaGluZyBoaW50cyAqLwo+ID4gdHlwbwo+IAo+IAo+IFdpbGwgZml4Lgo+
IAo+IAo+ID4gCj4gPiA+ICsjZGVmaW5lIFZIT1NUX0JBQ0tFTkRfRl9JT1RMQl9CQVRDSCAgMHgy
Cj4gPiA+ICAgI2RlZmluZSBWSE9TVF9TRVRfQkFDS0VORF9GRUFUVVJFUyBfSU9XKFZIT1NUX1ZJ
UlRJTywgMHgyNSwgX191NjQpCj4gPiA+ICAgI2RlZmluZSBWSE9TVF9HRVRfQkFDS0VORF9GRUFU
VVJFUyBfSU9SKFZIT1NUX1ZJUlRJTywgMHgyNiwgX191NjQpCj4gPiA+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3VhcGkvbGludXgvdmhvc3RfdHlwZXMuaCBiL2luY2x1ZGUvdWFwaS9saW51eC92aG9z
dF90eXBlcy5oCj4gPiA+IGluZGV4IDY2OTQ1N2NlNWM0OC4uNWMxMmZhZmZkZGU5IDEwMDY0NAo+
ID4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdmhvc3RfdHlwZXMuaAo+ID4gPiArKysgYi9p
bmNsdWRlL3VhcGkvbGludXgvdmhvc3RfdHlwZXMuaAo+ID4gPiBAQCAtNjAsNiArNjAsMTMgQEAg
c3RydWN0IHZob3N0X2lvdGxiX21zZyB7Cj4gPiA+ICAgI2RlZmluZSBWSE9TVF9JT1RMQl9VUERB
VEUgICAgICAgICAyCj4gPiA+ICAgI2RlZmluZSBWSE9TVF9JT1RMQl9JTlZBTElEQVRFICAgICAz
Cj4gPiA+ICAgI2RlZmluZSBWSE9TVF9JT1RMQl9BQ0NFU1NfRkFJTCAgICA0Cj4gPiA+ICsvKiBW
SE9TVF9JT1RMQl9CQVRDSF9CRUdJTiBpcyBhIGhpbnQgdGhhdCB1c2Vyc3BhY2Ugd2lsbCB1cGRh
dGUKPiA+ID4gKyAqIHNldmVyYWwgbWFwcGluZ3MgYWZ0ZXJ3YXJkcy4gVkhPU1RfSU9UTEJfQkFU
Q0hfRU5EIGlzIGEgaGludCB0aGF0Cj4gPiA+ICsgKiB1c2Vyc3BhY2UgaGFkIGZpbmlzaGVkIHRo
ZSBtYXBwaW5nIHVwZGF0aW5nLgo+ID4gCj4gPiBXZWxsIG5vdCBqdXN0IGhpbnRzIC0gaW4gZmFj
dCB1cGRhdGVzIGRvIG5vdCB0YWtlIHBsYWNlCj4gPiB1bnRpbCBfRU5ELgo+ID4gCj4gPiBIb3cg
YWJvdXQ6Cj4gPiAKPiA+IC8qIFZIT1NUX0lPVExCX0JBVENIX0JFR0lOIGFuZCBWSE9TVF9JT1RM
Ql9CQVRDSF9FTkQgYWxsb3cgbW9kaWZ5aW5nCj4gPiAgICogbXVsdGlwbGUgbWFwcGluZ3MgaW4g
b25lIGdvOiBiZWdpbm5pbmcgd2l0aAo+ID4gICAqIFZIT1NUX0lPVExCX0JBVENIX0JFR0lOLCBm
b2xsb3dlZCBieSBhbnkgbnVtYmVyIG9mCj4gPiAgICAgVkhPU1RfSU9UTEJfVVBEQVRFIG1lc3Nh
Z2VzLCBhbmQgZW5kaW5nIHdpdGggVkhPU1RfSU9UTEJfQkFUQ0hfRU5ELgo+ID4gICAqLwo+IAo+
IAo+IFRoYXQncyBiZXR0ZXIuCgoKSXMgdGhlcmUgYSBndWFyYW50ZWUgdGhhdCB0aGVzZSBjaGFu
Z2VzIHRha2UgcGxhY2UgYXRvbWljYWxseT8KTGV0J3MgZG9jdW1lbnQgdGhhdC4KCj4gCj4gPiAK
PiA+IAo+ID4gPiBXaGVuIHRob3NlIHR3byBmbGFncwo+ID4gPiArICogd2VyZSBzZXQsIGtlcm5l
bCB3aWxsIGlnbm9yZSB0aGUgcmVzdCBmaWxlZHMgb2YgdGhlIElPVExCIG1lc3NhZ2UuCj4gPiBo
b3cgYWJvdXQ6Cj4gPiAKPiA+IHdoZW4gb25lIG9mIHRoZXNlIHR3byB2YWx1ZXMgaXMgdXNlZCBh
cyB0aGUgbWVzc2FnZSB0eXBlLCB0aGUKPiA+IHJlc3Qgb2YgdGhlIGZpZWxkcyBpbiB0aGUgbWVz
c2FnZSBhcmUgaWdub3JlZC4KPiAKPiAKPiBZZXMuCj4gCj4gV2lsbCBmaXguCj4gCj4gVGhhbmtz
Cj4gCj4gCj4gPiAKPiA+ID4gKyAqLwo+ID4gPiArI2RlZmluZSBWSE9TVF9JT1RMQl9CQVRDSF9C
RUdJTiAgICA1Cj4gPiA+ICsjZGVmaW5lIFZIT1NUX0lPVExCX0JBVENIX0VORCAgICAgIDYKPiA+
ID4gICAJX191OCB0eXBlOwo+ID4gPiAgIH07Cj4gPiA+IC0tIAo+ID4gPiAyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
