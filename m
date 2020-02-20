Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3281658DC
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 08:59:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EE4A785EBB;
	Thu, 20 Feb 2020 07:59:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmFBJAtsTieC; Thu, 20 Feb 2020 07:59:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7CE2885E93;
	Thu, 20 Feb 2020 07:59:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69AFDC1D88;
	Thu, 20 Feb 2020 07:59:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DD0CC013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 07:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 343EC85C8F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 07:59:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sdTdCZAy0v-3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 07:58:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8605885B97
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 07:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582185538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Z0RijPXNJdfGzvA5NYGTBhclOcf2eBEKOyQVAGm4Ws=;
 b=Bne6VpPZuAjExjb4eGtFtJXT7TG6p961iZqp+mP7w6e/PhQNgiQXP6esEOc6kGoPLzcMt3
 nwAfY5gABK0KAGdg28iq9N5iSknAGfZigZl/dU1+ni6hldoZKhbQj4EJczjjEEBbWozm27
 gPWG4uVWFp5YZ8SuWcZlc4/rmbRLq3Q=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-dT6fSVBSNseEWgm28vF64A-1; Thu, 20 Feb 2020 02:58:51 -0500
Received: by mail-qk1-f197.google.com with SMTP id t186so2109388qkf.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 23:58:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7Z0RijPXNJdfGzvA5NYGTBhclOcf2eBEKOyQVAGm4Ws=;
 b=YkKmldcJnp4bzu/tnNXTWs6UVS+0+KbypTeXJn3JMVvAO2xcE/J7WoS+vI5f8sVMv4
 Zh2cINkNe7Ww9NGMm5wDXXyt1OBT0gggzTJW8z/ELSbW/j3cRnxC2WPV9R4PZ3r1cDiS
 hxCET3BTOitRUeJ7lSaCoe6uwBe+4FI00J0HN0RV/Hpp+aJqafOLuQ44BK48uEv9k57U
 ZnvtQs6vorTQ2dbdPzo85lzCLGS2ACH/+xkNPMetJVNtv6aHcqNq0bsJsBTYuDLUK5uo
 HAS+HoLOngcXFvyFUzVdqTKuxppCLutSdacasJShoNnAjtupaTwZaHKHm5cj2qrdwKw+
 v6lA==
X-Gm-Message-State: APjAAAUZ/MiNephpQ1k+WA/FdBOVKphOX5HTpfeX8NrcSGVTn8Bau1xC
 6kgX/60/VpYFsVz/LD3DvsmHl5Zu2TecVCmhJTe9A0PfIyj2yMbrWB5/zhx0dT85EVMAp643Jnt
 niwzkOWXrHlvSpBEO01Ns6DGkdk0N5KXOuOG17TSE3Q==
X-Received: by 2002:ad4:44ee:: with SMTP id p14mr23520865qvt.114.1582185530485; 
 Wed, 19 Feb 2020 23:58:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqyyWmYqvCM00xyfylnKvfB52g6zUzd0XRMWKnK5T4ecBLdvSAA5F6G69aWL1guNfOqbGh5aog==
X-Received: by 2002:ad4:44ee:: with SMTP id p14mr23520857qvt.114.1582185530206; 
 Wed, 19 Feb 2020 23:58:50 -0800 (PST)
Received: from redhat.com (bzq-109-67-14-209.red.bezeqint.net. [109.67.14.209])
 by smtp.gmail.com with ESMTPSA id o10sm1327660qtp.38.2020.02.19.23.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 23:58:49 -0800 (PST)
Date: Thu, 20 Feb 2020 02:58:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Subject: Re: [PATCH] virtio: Work around frames incorrectly marked as gso
Message-ID: <20200220025506-mutt-send-email-mst@kernel.org>
References: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
 <57230228-7030-c65f-a24f-910ca52bbe9e@cambridgegreys.com>
 <f78bfe6e-2ffc-3734-9618-470f1afea0c6@redhat.com>
 <918222d9-816a-be70-f8af-b8dfcb586240@cambridgegreys.com>
 <20200211053502-mutt-send-email-mst@kernel.org>
 <9547228b-aa93-f2b6-6fdc-8d33cde3716a@cambridgegreys.com>
 <20200213045937-mutt-send-email-mst@kernel.org>
 <94fb9656-99ee-a001-e428-9d76c3620e61@gmail.com>
 <20200213105010-mutt-send-email-mst@kernel.org>
 <35510da7-08f1-4aa5-c6d6-6bffbccaee0c@cambridgegreys.com>
MIME-Version: 1.0
In-Reply-To: <35510da7-08f1-4aa5-c6d6-6bffbccaee0c@cambridgegreys.com>
X-MC-Unique: dT6fSVBSNseEWgm28vF64A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-um@lists.infradead.org,
 Eric Dumazet <eric.dumazet@gmail.com>,
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

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMDQ6MjM6MjRQTSArMDAwMCwgQW50b24gSXZhbm92IHdy
b3RlOgo+IAo+IE9uIDEzLzAyLzIwMjAgMTU6NTMsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToK
PiA+IE9uIFRodSwgRmViIDEzLCAyMDIwIGF0IDA3OjQ0OjA2QU0gLTA4MDAsIEVyaWMgRHVtYXpl
dCB3cm90ZToKPiA+ID4gCj4gPiA+IE9uIDIvMTMvMjAgMjowMCBBTSwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgRmViIDEyLCAyMDIwIGF0IDA1OjM4OjA5UE0gKzAw
MDAsIEFudG9uIEl2YW5vdiB3cm90ZToKPiA+ID4gPiA+IAo+ID4gPiA+ID4gT24gMTEvMDIvMjAy
MCAxMDozNywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBUdWUsIEZl
YiAxMSwgMjAyMCBhdCAwNzo0MjozN0FNICswMDAwLCBBbnRvbiBJdmFub3Ygd3JvdGU6Cj4gPiA+
ID4gPiA+ID4gT24gMTEvMDIvMjAyMCAwMjo1MSwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+
ID4gPiA+IE9uIDIwMjAvMi8xMSDkuIrljYgxMjo1NSwgQW50b24gSXZhbm92IHdyb3RlOgo+ID4g
PiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gT24gMDkvMTIvMjAxOSAxMDo0OCwgYW50
b24uaXZhbm92QGNhbWJyaWRnZWdyZXlzLmNvbSB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gPiBG
cm9tOiBBbnRvbiBJdmFub3YgPGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5cy5jb20+Cj4gPiA+
ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4gU29tZSBvZiB0aGUgZnJhbWVzIG1h
cmtlZCBhcyBHU08gd2hpY2ggYXJyaXZlIGF0Cj4gPiA+ID4gPiA+ID4gPiA+ID4gdmlydGlvX25l
dF9oZHJfZnJvbV9za2IoKSBoYXZlIG5vIEdTT19UWVBFLCBubwo+ID4gPiA+ID4gPiA+ID4gPiA+
IGZyYWdtZW50cyAoZGF0YV9sZW4gPSAwKSBhbmQgbGVuZ3RoIHNpZ25pZmljYW50bHkgc2hvcnRl
cgo+ID4gPiA+ID4gPiA+ID4gPiA+IHRoYW4gdGhlIE1UVSAoNzUyIGluIG15IGV4cGVyaW1lbnRz
KS4KPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gPiBUaGlzIGlzIG9ic2Vy
dmVkIG9uIHJhdyBzb2NrZXRzIHJlYWRpbmcgb2ZmIHZFdGggaW50ZXJmYWNlcwo+ID4gPiA+ID4g
PiA+ID4gPiA+IGluIGFsbCA0LnggYW5kIDUueCBrZXJuZWxzIEkgdGVzdGVkLgo+ID4gPiA+ID4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiA+IFRoZXNlIGZyYW1lcyBhcmUgcmVwb3J0ZWQg
YXMgaW52YWxpZCB3aGlsZSB0aGV5IGFyZSBpbiBmYWN0Cj4gPiA+ID4gPiA+ID4gPiA+ID4gZ3Nv
LWxlc3MgZnJhbWVzLgo+ID4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiA+IFRo
aXMgcGF0Y2ggbWFya3MgdGhlIHZuZXQgaGVhZGVyIGFzIG5vLUdTTyBmb3IgdGhlbSBpbnN0ZWFk
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gb2YgcmVwb3J0aW5nIGl0IGFzIGludmFsaWQuCj4gPiA+ID4g
PiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW50b24gSXZh
bm92IDxhbnRvbi5pdmFub3ZAY2FtYnJpZGdlZ3JleXMuY29tPgo+ID4gPiA+ID4gPiA+ID4gPiA+
IC0tLQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgwqAgaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0Lmgg
fCA4ICsrKysrKy0tCj4gPiA+ID4gPiA+ID4gPiA+ID4gICDCoCAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3ZpcnRpb19uZXQuaCBiL2lu
Y2x1ZGUvbGludXgvdmlydGlvX25ldC5oCj4gPiA+ID4gPiA+ID4gPiA+ID4gaW5kZXggMGQxZmU5
Mjk3YWM2Li5kOTBkNWNmZjFiOWEgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLS0tIGEvaW5j
bHVkZS9saW51eC92aXJ0aW9fbmV0LmgKPiA+ID4gPiA+ID4gPiA+ID4gPiArKysgYi9pbmNsdWRl
L2xpbnV4L3ZpcnRpb19uZXQuaAo+ID4gPiA+ID4gPiA+ID4gPiA+IEBAIC0xMTIsOCArMTEyLDEy
IEBAIHN0YXRpYyBpbmxpbmUgaW50Cj4gPiA+ID4gPiA+ID4gPiA+ID4gdmlydGlvX25ldF9oZHJf
ZnJvbV9za2IoY29uc3Qgc3RydWN0IHNrX2J1ZmYgKnNrYiwKPiA+ID4gPiA+ID4gPiA+ID4gPiAg
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhkci0+Z3NvX3R5cGUgPSBWSVJUSU9fTkVUX0hE
Ul9HU09fVENQVjQ7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICDCoMKgwqDCoMKgwqDCoMKgwqAgZWxz
ZSBpZiAoc2luZm8tPmdzb190eXBlICYgU0tCX0dTT19UQ1BWNikKPiA+ID4gPiA+ID4gPiA+ID4g
PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhkci0+Z3NvX3R5cGUgPSBWSVJUSU9fTkVU
X0hEUl9HU09fVENQVjY7Cj4gPiA+ID4gPiA+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgIGVsc2UK
PiA+ID4gPiA+ID4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZB
TDsKPiA+ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgZWxzZSB7Cj4gPiA+ID4gPiA+
ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHNrYi0+ZGF0YV9sZW4gPT0gMCkK
PiA+ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhkci0+
Z3NvX3R5cGUgPSBWSVJUSU9fTkVUX0hEUl9HU09fTk9ORTsKPiA+ID4gPiA+ID4gPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlCj4gPiA+ID4gPiA+ID4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiA+ID4gPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqAgfQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChzaW5mby0+Z3NvX3R5cGUgJiBTS0JfR1NPX1RDUF9FQ04pCj4gPiA+ID4gPiA+ID4g
PiA+ID4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoZHItPmdzb190eXBlIHw9IFZJUlRJ
T19ORVRfSERSX0dTT19FQ047Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICDCoMKgwqDCoMKgIH0gZWxz
ZQo+ID4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiBwaW5nLgo+ID4gPiA+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IERvIHlvdSBtZWFuIGdzb19zaXplIGlzIHNldCBidXQg
Z3NvX3R5cGUgaXMgbm90PyBMb29rcyBsaWtlIGEgYnVnCj4gPiA+ID4gPiA+ID4gPiBlbHNld2hl
cmUuCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IFRoYW5rcwo+ID4gPiA+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBZZXMuCj4gPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+ID4gSSBjb3VsZCBub3QgdHJhY2UgaXQgd2hlcmUgaXQgaXMgY29taW5nIGZyb20u
Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gSSBzZWUgaXQgd2hlbiBkb2luZyByZWN2bW1z
ZyBvbiByYXcgc29ja2V0cyBpbiB0aGUgVU1MIHZlY3RvciBuZXR3b3JrCj4gPiA+ID4gPiA+ID4g
ZHJpdmVycy4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gSSB0aGluayB3ZSBuZWVkIHRvIGZp
bmQgdGhlIGN1bHByaXQgYW5kIGZpeCBpdCB0aGVyZSwgbG90cyBvZiBvdGhlciB0aGluZ3MKPiA+
ID4gPiA+ID4gY2FuIGJyZWFrIG90aGVyd2lzZS4KPiA+ID4gPiA+ID4gSnVzdCBwcmludGluZyBv
dXQgc2tiLT5kZXYtPm5hbWUgc2hvdWxkIGRvIHRoZSB0cmljaywgbm8/Cj4gPiA+ID4gPiBUaGUg
cHJpbnRrIGluIHZpcnRpb19uZXRfaGRyX2Zyb21fc2tiIHNheXMgTlVMTC4KPiA+ID4gPiA+IAo+
ID4gPiA+ID4gVGhhdCBpcyBwcm9iYWJseSBub3JtYWwgZm9yIGEgbG9jYWxseSBvcmlnaW5hdGVk
IGZyYW1lLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJIGNhbm5vdCByZXByb2R1Y2UgdGhpcyB3aXRo
IG5ldHdvcmsgdHJhZmZpYyBieSB0aGUgd2F5IC0gaXQgaGFwcGVucyBvbmx5IGlmIHRoZSB0cmFm
ZmljIGlzIGxvY2FsbHkgb3JpZ2luYXRlZCBvbiB0aGUgaG9zdC4KPiA+ID4gPiA+IAo+ID4gPiA+
ID4gQSwKPiA+ID4gPiBPSyBzbyBpcyBpdCBjb2RlIGluIF9fdGNwX3RyYW5zbWl0X3NrYiB0aGF0
IHNldHMgZ3NvX3NpemUgdG8gbm9uLW51bGwKPiA+ID4gPiB3aGVuIGdzb190eXBlIGlzIDA/Cj4g
PiA+ID4gCj4gPiA+IENvcnJlY3Qgd2F5IHRvIGRldGVybWluZSBpZiBhIHBhY2tldCBpcyBhIGdz
byBvbmUgaXMgYnkgbG9va2luZyBhdCBnc29fc2l6ZS4KPiA+ID4gVGhlbiBvbmx5IGl0IGlzIGxl
Z2FsIGxvb2tpbmcgYXQgZ3NvX3R5cGUKPiA+ID4gCj4gPiA+IAo+ID4gPiBzdGF0aWMgaW5saW5l
IGJvb2wgc2tiX2lzX2dzbyhjb25zdCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQo+ID4gPiB7Cj4gPiA+
ICAgICAgcmV0dXJuIHNrYl9zaGluZm8oc2tiKS0+Z3NvX3NpemU7Cj4gPiA+IH0KPiA+ID4gCj4g
PiA+IC8qIE5vdGU6IFNob3VsZCBiZSBjYWxsZWQgb25seSBpZiBza2JfaXNfZ3NvKHNrYikgaXMg
dHJ1ZSAqLwo+ID4gPiBzdGF0aWMgaW5saW5lIGJvb2wgc2tiX2lzX2dzb192Nihjb25zdCBzdHJ1
Y3Qgc2tfYnVmZiAqc2tiKQo+ID4gPiAuLi4KPiA+ID4gCj4gPiA+IAo+ID4gPiBUaGVyZSBpcyBh
YnNvbHV0ZWx5IG5vIHJlbGF0aW9uIGJldHdlZW4gR1NPIGFuZCBza2ItPmRhdGFfbGVuLCBza2Ig
Y2FuIGJlIGxpbmVhcml6ZWQKPiA+ID4gZm9yIHZhcmlvdXMgb3J0aG9nb25hbCByZWFzb25zLgo+
ID4gVGhlIHJlcG9ydGVkIHByb2JsZW0gaXMgdGhhdCB2aXJ0aW8gZ2V0cyBhIHBhY2tldCB3aGVy
ZSBnc29fc2l6ZQo+ID4gaXMgITAgYnV0IGdzb190eXBlIGlzIDAuCj4gPiAKPiA+IEl0IGN1cnJl
bnRseSBkcm9wcyB0aGVzZSBvbiB0aGUgYXNzdW1wdGlvbiB0aGF0IGl0J3Mgc29tZSB0eXBlCj4g
PiBvZiBhIGdzbyBwYWNrZXQgaXQgZG9lcyBub3Qga25vdyBob3cgdG8gaGFuZGxlLgo+ID4gCj4g
PiAKPiA+IFNvIHlvdSBhcmUgc2F5aW5nIGlmIHNrYl9pc19nc28gd2UgY2FuIHN0aWxsIGhhdmUg
Z3NvX3R5cGUgc2V0IHRvIDAsCj4gPiBhbmQgdGhhdCdzIGFuIGV4cGVjdGVkIGNvbmZpZ3VyYXRp
b24/Cj4gPiAKPiA+IFNvIHRoZSBwYXRjaCBzaG91bGQganVzdCBiZToKPiA+IAo+ID4gCj4gPiAt
ICAgICAgICBpZiAoc2tiX2lzX2dzbyhza2IpKSB7Cj4gPiArICAgICAgICBpZiAoc2tiX2lzX2dz
byhza2IpICYmIHNpbmZvLT5nc29fdHlwZSkgewo+ID4gCj4gWWVzLCBwcm92aWRlZCB0aGF0IHNr
Yl9pc19nc28oc2tiKSBhbmQgc2luZm8tPmdzb190eXBlID09IDAgaXMgYSB2YWxpZCBzdGF0ZS4K
PiAKPiBJIGFncmVlIHdpdGggSmFzb24sIHRoZXJlIG1heSBiZSBzb21ldGhpbmcgd3JvbmcgZ29p
bmcgb24gaGVyZSBhbmQgd2UgbmVlZCB0byBmaW5kIHRoZSBzb3VyY2Ugd2hpY2ggY3JlYXRlcyB0
aGVzZSBwYWNrZXRzLgo+IAo+IEEuCgoKV2FudCB0byBzdWJtaXQgYSBwYXRjaCB0byBhZGRyZXNz
IHRoaXMgZm9yIG5vdz8KCj4gPiAKPiA+ID8KPiA+IAo+ID4gCj4gPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtdW0gbWFpbGluZyBsaXN0
Cj4gPiBsaW51eC11bUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXVtCj4gCj4gLS0gCj4gQW50b24gUi4gSXZh
bm92Cj4gQ2FtYnJpZGdlZ3JleXMgTGltaXRlZC4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5kLiBDb21w
YW55IE51bWJlciAxMDI3MzY2MQo+IGh0dHBzOi8vd3d3LmNhbWJyaWRnZWdyZXlzLmNvbS8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
