Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B084971457A
	for <lists.virtualization@lfdr.de>; Mon, 29 May 2023 09:28:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFC1360B1A;
	Mon, 29 May 2023 07:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFC1360B1A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Thn3rXeX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnEO4gRqjthv; Mon, 29 May 2023 07:28:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E1C3760B20;
	Mon, 29 May 2023 07:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C3760B20
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27576C0089;
	Mon, 29 May 2023 07:28:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F9C8C002A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 May 2023 07:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69F9381DF6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 May 2023 07:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69F9381DF6
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Thn3rXeX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FiuBpOapa9L3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 May 2023 07:28:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88CA3818C9
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88CA3818C9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 May 2023 07:28:32 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2af1c884b08so36761601fa.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 May 2023 00:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685345310; x=1687937310;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PjsN5fk/DFO2FMNlviuxDCLmb3ffNRXz+JeOMI+cajU=;
 b=Thn3rXeXxFWGN583MVThEG/Gp/158xMTOU5oOTHLjKzkbZ4/4fp1lG0IK4SPrky0Y9
 DWR6pbvTT+8KKvppjOT9Mp14uuq75EucuFJnFZFvlHOarVDrsCdXYQTK5jykb9AYIXEY
 SkXDFgWX5YClUAkkam82OEZ2IiLkkigQxKVJih8JedwF9klJN07coMNshsgqU+JD5tLx
 FP7yU4lbmNFIe0diOWTUWWYdPHtZ7EjLazL5P41wQAoin2iKGr2M7ldTHXe6X347/Rvc
 Gmml3sRn2hxWTIAFZ+Z9l1ELddx+FHb/jLQ2hIo5E4nCUvQzoltRcSnJvFH/a1/+Bxmk
 //XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685345310; x=1687937310;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PjsN5fk/DFO2FMNlviuxDCLmb3ffNRXz+JeOMI+cajU=;
 b=JCS9Kqg5PYGkSz6fFq2hUDyDMeWTJtUUJlUY/gpeS0SQ2HwYOKYtmcn0P1LInfeWNi
 BxUN9vs37ZU1K4Bu+J1zQcZDIqvkwN4nY8GGIZIRRD4sMNX3t3TJnOocCq4eABXdM5rT
 bOBJPJtTTrigOnsPNhzGgohawWnkuqiMbRec6mSP9P5cUFsfLJwu9hoiSiQpBaKOJ9JY
 Z8uRpAN+9m75nIuD6uSjAf6XZA2BnxXohuK3fBU7WZSgP9x0k6LWQsGjRVvdKVpgGxGi
 Wqo9dVvFTQ0Bja+MfhI3RDsQNYU6wjtKMkGr3RQ6NfqYBCwy+oavFeTCIuNbIqo1GBUx
 3DjQ==
X-Gm-Message-State: AC+VfDxquOw8CzV/hN9gPEYv5ZxgKALJeBY8WgRvcbJrKZISHs8xH1Hs
 XlWHoNfo03XmzJ+Bix26JCUXyhENPFxE9q/vpiM=
X-Google-Smtp-Source: ACHHUZ4AiCb2O+MN4guzGAJW94jOIEiQMul7ITUDSJXVEgMzsNcT1/pSWAP6rgrWhgmOk6S+1oUsWWTXSzPJCsbHEtM=
X-Received: by 2002:a05:651c:2c1:b0:2ac:75fa:eef0 with SMTP id
 f1-20020a05651c02c100b002ac75faeef0mr2270344ljo.7.1685345310121; Mon, 29 May
 2023 00:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230526054621.18371-1-liangchen.linux@gmail.com>
 <20230526054621.18371-2-liangchen.linux@gmail.com>
 <CACGkMEv+5150S4ooWFMnUs-GpwRYgRMTku0ZgkFpH5iFR1qQsw@mail.gmail.com>
 <CAKhg4tL2b9LEsaNuLi94Zf9XQ4S2FyoXWzW9wTTkrU8L1qNQcQ@mail.gmail.com>
 <20230528023956-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230528023956-mutt-send-email-mst@kernel.org>
From: Liang Chen <liangchen.linux@gmail.com>
Date: Mon, 29 May 2023 15:28:17 +0800
Message-ID: <CAKhg4t+8TsNZ-0hzfo63qCh_uFYHCmyZR+Fx+rC8garnMBt9jw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/5] virtio_net: Add page_pool support to improve
 performance
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: xuanzhuo@linux.alibaba.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexander.duyck@gmail.com,
 virtualization@lists.linux-foundation.org, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net
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

T24gU3VuLCBNYXkgMjgsIDIwMjMgYXQgMjo0MOKAr1BNIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBNYXkgMjcsIDIwMjMgYXQgMDg6MzU6MDFQ
TSArMDgwMCwgTGlhbmcgQ2hlbiB3cm90ZToKPiA+IE9uIEZyaSwgTWF5IDI2LCAyMDIzIGF0IDI6
NTHigK9QTSBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4KPiA+
ID4gT24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgMTo0NuKAr1BNIExpYW5nIENoZW4gPGxpYW5nY2hl
bi5saW51eEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gVGhlIGltcGxlbWVudGF0
aW9uIGF0IHRoZSBtb21lbnQgdXNlcyBvbmUgcGFnZSBwZXIgcGFja2V0IGluIGJvdGggdGhlCj4g
PiA+ID4gbm9ybWFsIGFuZCBYRFAgcGF0aC4KPiA+ID4KPiA+ID4gSXQncyBiZXR0ZXIgdG8gZXhw
bGFpbiB3aHkgd2UgbmVlZCBhIHBhZ2UgcG9vbCBhbmQgaG93IGl0IGNhbiBoZWxwIHRoZQo+ID4g
PiBwZXJmb3JtYW5jZS4KPiA+ID4KPiA+Cj4gPiBTdXJlLCBJIHdpbGwgaW5jbHVkZSB0aGF0IG9u
IHYyLgo+ID4gPiA+IEluIGFkZGl0aW9uLCBpbnRyb2R1Y2luZyBhIG1vZHVsZSBwYXJhbWV0ZXIg
dG8gZW5hYmxlCj4gPiA+ID4gb3IgZGlzYWJsZSB0aGUgdXNhZ2Ugb2YgcGFnZSBwb29sIChkaXNh
YmxlZCBieSBkZWZhdWx0KS4KPiA+ID4KPiA+ID4gSWYgcGFnZSBwb29sIHdpbnMgZm9yIG1vc3Qg
b2YgdGhlIGNhc2VzLCBhbnkgcmVhc29uIHRvIGRpc2FibGUgaXQgYnkgZGVmYXVsdD8KPiA+ID4K
PiA+Cj4gPiBUaGFuayB5b3UgZm9yIHJhaXNpbmcgdGhlIHBvaW50LiBJdCBkb2VzIG1ha2Ugc2Vu
c2UgdG8gZW5hYmxlIGl0IGJ5IGRlZmF1bHQuCj4KPiBJJ2QgbGlrZSB0byBzZWUgbW9yZSBiZW5j
aG1hcmtzIHBscyB0aGVuLCB3aXRoIGEgdmFyaWV0eSBvZiBwYWNrZXQKPiBzaXplcywgdWRwIGFu
ZCB0Y3AuCj4KClN1cmUsIG1vcmUgYmVuY2htYXJrcyB3aWxsIGJlIHByb3ZpZGVkLiBUaGFua3Mu
CgoKPiA+ID4gPgo+ID4gPiA+IEluIHNpbmdsZS1jb3JlIHZtIHRlc3RpbmcgZW52aXJvbm1lbnRz
LCBpdCBnaXZlcyBhIG1vZGVzdCBwZXJmb3JtYW5jZSBnYWluCj4gPiA+ID4gaW4gdGhlIG5vcm1h
bCBwYXRoLgo+ID4gPiA+ICAgVXBzdHJlYW0gY29kZWJhc2U6IDQ3LjUgR2JpdHMvc2VjCj4gPiA+
ID4gICBVcHN0cmVhbSBjb2RlYmFzZSArIHBhZ2VfcG9vbCBzdXBwb3J0OiA1MC4yIEdiaXRzL3Nl
Ywo+ID4gPiA+Cj4gPiA+ID4gSW4gbXVsdGktY29yZSB2bSB0ZXN0aW5nIGVudmlyb25tZW50cywg
VGhlIG1vc3Qgc2lnbmlmaWNhbnQgcGVyZm9ybWFuY2UKPiA+ID4gPiBnYWluIGlzIG9ic2VydmVk
IGluIFhEUCBjcHVtYXA6Cj4gPiA+ID4gICBVcHN0cmVhbSBjb2RlYmFzZTogMS4zOCBHYml0cy9z
ZWMKPiA+ID4gPiAgIFVwc3RyZWFtIGNvZGViYXNlICsgcGFnZV9wb29sIHN1cHBvcnQ6IDkuNzQg
R2JpdHMvc2VjCj4gPiA+Cj4gPiA+IFBsZWFzZSBzaG93IG1vcmUgZGV0YWlscyBvbiB0aGUgdGVz
dC4gRS5nIHdoaWNoIGtpbmRzIG9mIHRlc3RzIGhhdmUKPiA+ID4geW91IG1lYXN1cmVkPwo+ID4g
Pgo+ID4gPiBCdHcsIGl0IHdvdWxkIGJlIGJldHRlciB0byBtZWFzdXJlIFBQUyBhcyB3ZWxsLgo+
ID4gPgo+ID4KPiA+IFN1cmUuIEl0IHdpbGwgYmUgYWRkZWQgb24gdjIuCj4gPiA+ID4KPiA+ID4g
PiBXaXRoIHRoaXMgZm91bmRhdGlvbiwgd2UgY2FuIGZ1cnRoZXIgaW50ZWdyYXRlIHBhZ2UgcG9v
bCBmcmFnbWVudGF0aW9uIGFuZAo+ID4gPiA+IERNQSBtYXAvdW5tYXAgc3VwcG9ydC4KPiA+ID4g
Pgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExpYW5nIENoZW4gPGxpYW5nY2hlbi5saW51eEBnbWFp
bC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYyB8IDE4
OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0KPiA+ID4KPiA+ID4gSSBi
ZWxpZXZlIHdlIHNob3VsZCBtYWtlIHZpcnRpby1uZXQgdG8gc2VsZWN0IENPTkZJR19QQUdFX1BP
T0wgb3IgZG8KPiA+ID4gdGhlIGlmZGVmIHRyaWNrcyBhdCBsZWFzdC4KPiA+ID4KPiA+Cj4gPiBT
dXJlLiBpdCB3aWxsIGJlIGRvbmUgb24gdjIuCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNDYg
aW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4g
PiA+ID4gaW5kZXggYzVkY2EwZDkyZTY0Li45OWMwY2EwYzE3ODEgMTAwNjQ0Cj4gPiA+ID4gLS0t
IGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9uZXQvdmly
dGlvX25ldC5jCj4gPiA+ID4gQEAgLTMxLDYgKzMxLDkgQEAgbW9kdWxlX3BhcmFtKGNzdW0sIGJv
b2wsIDA0NDQpOwo+ID4gPiA+ICBtb2R1bGVfcGFyYW0oZ3NvLCBib29sLCAwNDQ0KTsKPiA+ID4g
PiAgbW9kdWxlX3BhcmFtKG5hcGlfdHgsIGJvb2wsIDA2NDQpOwo+ID4gPiA+Cj4gPiA+ID4gK3N0
YXRpYyBib29sIHBhZ2VfcG9vbF9lbmFibGVkOwo+ID4gPiA+ICttb2R1bGVfcGFyYW0ocGFnZV9w
b29sX2VuYWJsZWQsIGJvb2wsIDA0MDApOwo+ID4gPiA+ICsKPiA+ID4gPiAgLyogRklYTUU6IE1U
VSBpbiBjb25maWcuICovCj4gPiA+ID4gICNkZWZpbmUgR09PRF9QQUNLRVRfTEVOIChFVEhfSExF
TiArIFZMQU5fSExFTiArIEVUSF9EQVRBX0xFTikKPiA+ID4gPiAgI2RlZmluZSBHT09EX0NPUFlf
TEVOICAxMjgKPiA+ID4gPiBAQCAtMTU5LDYgKzE2Miw5IEBAIHN0cnVjdCByZWNlaXZlX3F1ZXVl
IHsKPiA+ID4gPiAgICAgICAgIC8qIENoYWluIHBhZ2VzIGJ5IHRoZSBwcml2YXRlIHB0ci4gKi8K
PiA+ID4gPiAgICAgICAgIHN0cnVjdCBwYWdlICpwYWdlczsKPiA+ID4gPgo+ID4gPiA+ICsgICAg
ICAgLyogUGFnZSBwb29sICovCj4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgcGFnZV9wb29sICpwYWdl
X3Bvb2w7Cj4gPiA+ID4gKwo+ID4gPiA+ICAgICAgICAgLyogQXZlcmFnZSBwYWNrZXQgbGVuZ3Ro
IGZvciBtZXJnZWFibGUgcmVjZWl2ZSBidWZmZXJzLiAqLwo+ID4gPiA+ICAgICAgICAgc3RydWN0
IGV3bWFfcGt0X2xlbiBtcmdfYXZnX3BrdF9sZW47Cj4gPiA+ID4KPiA+ID4gPiBAQCAtNDU5LDYg
KzQ2NSwxNCBAQCBzdGF0aWMgc3RydWN0IHNrX2J1ZmYgKnZpcnRuZXRfYnVpbGRfc2tiKHZvaWQg
KmJ1ZiwgdW5zaWduZWQgaW50IGJ1ZmxlbiwKPiA+ID4gPiAgICAgICAgIHJldHVybiBza2I7Cj4g
PiA+ID4gIH0KPiA+ID4gPgo+ID4gPiA+ICtzdGF0aWMgdm9pZCB2aXJ0bmV0X3B1dF9wYWdlKHN0
cnVjdCByZWNlaXZlX3F1ZXVlICpycSwgc3RydWN0IHBhZ2UgKnBhZ2UpCj4gPiA+ID4gK3sKPiA+
ID4gPiArICAgICAgIGlmIChycS0+cGFnZV9wb29sKQo+ID4gPiA+ICsgICAgICAgICAgICAgICBw
YWdlX3Bvb2xfcHV0X2Z1bGxfcGFnZShycS0+cGFnZV9wb29sLCBwYWdlLCB0cnVlKTsKPiA+ID4g
PiArICAgICAgIGVsc2UKPiA+ID4gPiArICAgICAgICAgICAgICAgcHV0X3BhZ2UocGFnZSk7Cj4g
PiA+ID4gK30KPiA+ID4gPiArCj4gPiA+ID4gIC8qIENhbGxlZCBmcm9tIGJvdHRvbSBoYWxmIGNv
bnRleHQgKi8KPiA+ID4gPiAgc3RhdGljIHN0cnVjdCBza19idWZmICpwYWdlX3RvX3NrYihzdHJ1
Y3QgdmlydG5ldF9pbmZvICp2aSwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCByZWNlaXZlX3F1ZXVlICpycSwKPiA+ID4gPiBAQCAtNTU1LDcgKzU2OSw3
IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tfYnVmZiAqcGFnZV90b19za2Ioc3RydWN0IHZpcnRuZXRfaW5m
byAqdmksCj4gPiA+ID4gICAgICAgICBoZHIgPSBza2Jfdm5ldF9oZHIoc2tiKTsKPiA+ID4gPiAg
ICAgICAgIG1lbWNweShoZHIsIGhkcl9wLCBoZHJfbGVuKTsKPiA+ID4gPiAgICAgICAgIGlmIChw
YWdlX3RvX2ZyZWUpCj4gPiA+ID4gLSAgICAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2VfdG9fZnJl
ZSk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIHZpcnRuZXRfcHV0X3BhZ2UocnEsIHBhZ2VfdG9f
ZnJlZSk7Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIHJldHVybiBza2I7Cj4gPiA+ID4gIH0KPiA+
ID4gPiBAQCAtODAyLDcgKzgxNiw3IEBAIHN0YXRpYyBpbnQgdmlydG5ldF94ZHBfeG1pdChzdHJ1
Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gPiA+ICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4gPiAg
fQo+ID4gPiA+Cj4gPiA+ID4gLXN0YXRpYyB2b2lkIHB1dF94ZHBfZnJhZ3Moc3RydWN0IHhkcF9i
dWZmICp4ZHApCj4gPiA+ID4gK3N0YXRpYyB2b2lkIHB1dF94ZHBfZnJhZ3Moc3RydWN0IHhkcF9i
dWZmICp4ZHAsIHN0cnVjdCByZWNlaXZlX3F1ZXVlICpycSkKPiA+ID4gPiAgewo+ID4gPgo+ID4g
PiBycSBjb3VsZCBiZSBmZXRjaGVkIGZyb20geGRwX3J4cV9pbmZvPwo+ID4KPiA+IFllYWgsIGl0
IGhhcyB0aGUgcXVldWVfaW5kZXggdGhlcmUuCj4gPiA+Cj4gPiA+ID4gICAgICAgICBzdHJ1Y3Qg
c2tiX3NoYXJlZF9pbmZvICpzaGluZm87Cj4gPiA+ID4gICAgICAgICBzdHJ1Y3QgcGFnZSAqeGRw
X3BhZ2U7Cj4gPiA+ID4gQEAgLTgxMiw3ICs4MjYsNyBAQCBzdGF0aWMgdm9pZCBwdXRfeGRwX2Zy
YWdzKHN0cnVjdCB4ZHBfYnVmZiAqeGRwKQo+ID4gPiA+ICAgICAgICAgICAgICAgICBzaGluZm8g
PSB4ZHBfZ2V0X3NoYXJlZF9pbmZvX2Zyb21fYnVmZih4ZHApOwo+ID4gPiA+ICAgICAgICAgICAg
ICAgICBmb3IgKGkgPSAwOyBpIDwgc2hpbmZvLT5ucl9mcmFnczsgaSsrKSB7Cj4gPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgeGRwX3BhZ2UgPSBza2JfZnJhZ19wYWdlKCZzaGluZm8tPmZy
YWdzW2ldKTsKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBwdXRfcGFnZSh4ZHBfcGFn
ZSk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdmlydG5ldF9wdXRfcGFnZShycSwg
eGRwX3BhZ2UpOwo+ID4gPiA+ICAgICAgICAgICAgICAgICB9Cj4gPiA+ID4gICAgICAgICB9Cj4g
PiA+ID4gIH0KPiA+ID4gPiBAQCAtOTAzLDcgKzkxNywxMSBAQCBzdGF0aWMgc3RydWN0IHBhZ2Ug
KnhkcF9saW5lYXJpemVfcGFnZShzdHJ1Y3QgcmVjZWl2ZV9xdWV1ZSAqcnEsCj4gPiA+ID4gICAg
ICAgICBpZiAocGFnZV9vZmYgKyAqbGVuICsgdGFpbHJvb20gPiBQQUdFX1NJWkUpCj4gPiA+ID4g
ICAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ID4gPiA+Cj4gPiA+ID4gLSAgICAgICBwYWdl
ID0gYWxsb2NfcGFnZShHRlBfQVRPTUlDKTsKPiA+ID4gPiArICAgICAgIGlmIChycS0+cGFnZV9w
b29sKQo+ID4gPiA+ICsgICAgICAgICAgICAgICBwYWdlID0gcGFnZV9wb29sX2Rldl9hbGxvY19w
YWdlcyhycS0+cGFnZV9wb29sKTsKPiA+ID4gPiArICAgICAgIGVsc2UKPiA+ID4gPiArICAgICAg
ICAgICAgICAgcGFnZSA9IGFsbG9jX3BhZ2UoR0ZQX0FUT01JQyk7Cj4gPiA+ID4gKwo+ID4gPiA+
ICAgICAgICAgaWYgKCFwYWdlKQo+ID4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsK
PiA+ID4gPgo+ID4gPiA+IEBAIC05MjYsMjEgKzk0NCwyNCBAQCBzdGF0aWMgc3RydWN0IHBhZ2Ug
KnhkcF9saW5lYXJpemVfcGFnZShzdHJ1Y3QgcmVjZWl2ZV9xdWV1ZSAqcnEsCj4gPiA+ID4gICAg
ICAgICAgICAgICAgICAqIGlzIHNlbmRpbmcgcGFja2V0IGxhcmdlciB0aGFuIHRoZSBNVFUuCj4g
PiA+ID4gICAgICAgICAgICAgICAgICAqLwo+ID4gPiA+ICAgICAgICAgICAgICAgICBpZiAoKHBh
Z2Vfb2ZmICsgYnVmbGVuICsgdGFpbHJvb20pID4gUEFHRV9TSVpFKSB7Cj4gPiA+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgcHV0X3BhZ2UocCk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgdmlydG5ldF9wdXRfcGFnZShycSwgcCk7Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgZ290byBlcnJfYnVmOwo+ID4gPiA+ICAgICAgICAgICAgICAgICB9Cj4gPiA+ID4KPiA+
ID4gPiAgICAgICAgICAgICAgICAgbWVtY3B5KHBhZ2VfYWRkcmVzcyhwYWdlKSArIHBhZ2Vfb2Zm
LAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgcGFnZV9hZGRyZXNzKHApICsgb2ZmLCBi
dWZsZW4pOwo+ID4gPiA+ICAgICAgICAgICAgICAgICBwYWdlX29mZiArPSBidWZsZW47Cj4gPiA+
ID4gLSAgICAgICAgICAgICAgIHB1dF9wYWdlKHApOwo+ID4gPiA+ICsgICAgICAgICAgICAgICB2
aXJ0bmV0X3B1dF9wYWdlKHJxLCBwKTsKPiA+ID4gPiAgICAgICAgIH0KPiA+ID4gPgo+ID4gPiA+
ICAgICAgICAgLyogSGVhZHJvb20gZG9lcyBub3QgY29udHJpYnV0ZSB0byBwYWNrZXQgbGVuZ3Ro
ICovCj4gPiA+ID4gICAgICAgICAqbGVuID0gcGFnZV9vZmYgLSBWSVJUSU9fWERQX0hFQURST09N
Owo+ID4gPiA+ICAgICAgICAgcmV0dXJuIHBhZ2U7Cj4gPiA+ID4gIGVycl9idWY6Cj4gPiA+ID4g
LSAgICAgICBfX2ZyZWVfcGFnZXMocGFnZSwgMCk7Cj4gPiA+ID4gKyAgICAgICBpZiAocnEtPnBh
Z2VfcG9vbCkKPiA+ID4gPiArICAgICAgICAgICAgICAgcGFnZV9wb29sX3B1dF9mdWxsX3BhZ2Uo
cnEtPnBhZ2VfcG9vbCwgcGFnZSwgdHJ1ZSk7Cj4gPiA+ID4gKyAgICAgICBlbHNlCj4gPiA+ID4g
KyAgICAgICAgICAgICAgIF9fZnJlZV9wYWdlcyhwYWdlLCAwKTsKPiA+ID4gPiAgICAgICAgIHJl
dHVybiBOVUxMOwo+ID4gPiA+ICB9Cj4gPiA+ID4KPiA+ID4gPiBAQCAtMTE0NCw3ICsxMTY1LDcg
QEAgc3RhdGljIHZvaWQgbWVyZ2VhYmxlX2J1Zl9mcmVlKHN0cnVjdCByZWNlaXZlX3F1ZXVlICpy
cSwgaW50IG51bV9idWYsCj4gPiA+ID4gICAgICAgICAgICAgICAgIH0KPiA+ID4gPiAgICAgICAg
ICAgICAgICAgc3RhdHMtPmJ5dGVzICs9IGxlbjsKPiA+ID4gPiAgICAgICAgICAgICAgICAgcGFn
ZSA9IHZpcnRfdG9faGVhZF9wYWdlKGJ1Zik7Cj4gPiA+ID4gLSAgICAgICAgICAgICAgIHB1dF9w
YWdlKHBhZ2UpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICB2aXJ0bmV0X3B1dF9wYWdlKHJxLCBw
YWdlKTsKPiA+ID4gPiAgICAgICAgIH0KPiA+ID4gPiAgfQo+ID4gPiA+Cj4gPiA+ID4gQEAgLTEy
NjQsNyArMTI4NSw3IEBAIHN0YXRpYyBpbnQgdmlydG5ldF9idWlsZF94ZHBfYnVmZl9tcmcoc3Ry
dWN0IG5ldF9kZXZpY2UgKmRldiwKPiA+ID4gPiAgICAgICAgICAgICAgICAgY3VyX2ZyYWdfc2l6
ZSA9IHRydWVzaXplOwo+ID4gPiA+ICAgICAgICAgICAgICAgICB4ZHBfZnJhZ3NfdHJ1ZXN6ICs9
IGN1cl9mcmFnX3NpemU7Cj4gPiA+ID4gICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShsZW4g
PiB0cnVlc2l6ZSAtIHJvb20gfHwgY3VyX2ZyYWdfc2l6ZSA+IFBBR0VfU0laRSkpIHsKPiA+ID4g
PiAtICAgICAgICAgICAgICAgICAgICAgICBwdXRfcGFnZShwYWdlKTsKPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICB2aXJ0bmV0X3B1dF9wYWdlKHJxLCBwYWdlKTsKPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICBwcl9kZWJ1ZygiJXM6IHJ4IGVycm9yOiBsZW4gJXUgZXhjZWVk
cyB0cnVlc2l6ZSAlbHVcbiIsCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZGV2LT5uYW1lLCBsZW4sICh1bnNpZ25lZCBsb25nKSh0cnVlc2l6ZSAtIHJvb20pKTsKPiA+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBkZXYtPnN0YXRzLnJ4X2xlbmd0aF9lcnJvcnMr
KzsKPiA+ID4gPiBAQCAtMTI4Myw3ICsxMzA0LDcgQEAgc3RhdGljIGludCB2aXJ0bmV0X2J1aWxk
X3hkcF9idWZmX21yZyhzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gPiA+ICAgICAgICAgcmV0
dXJuIDA7Cj4gPiA+ID4KPiA+ID4gPiAgZXJyOgo+ID4gPiA+IC0gICAgICAgcHV0X3hkcF9mcmFn
cyh4ZHApOwo+ID4gPiA+ICsgICAgICAgcHV0X3hkcF9mcmFncyh4ZHAsIHJxKTsKPiA+ID4gPiAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gPiA+ICB9Cj4gPiA+ID4KPiA+ID4gPiBAQCAtMTM0
NCw3ICsxMzY1LDEwIEBAIHN0YXRpYyB2b2lkICptZXJnZWFibGVfeGRwX2dldF9idWYoc3RydWN0
IHZpcnRuZXRfaW5mbyAqdmksCj4gPiA+ID4gICAgICAgICAgICAgICAgIGlmICgqbGVuICsgeGRw
X3Jvb20gPiBQQUdFX1NJWkUpCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IE5VTEw7Cj4gPiA+ID4KPiA+ID4gPiAtICAgICAgICAgICAgICAgeGRwX3BhZ2UgPSBhbGxvY19w
YWdlKEdGUF9BVE9NSUMpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAocnEtPnBhZ2VfcG9v
bCkKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICB4ZHBfcGFnZSA9IHBhZ2VfcG9vbF9k
ZXZfYWxsb2NfcGFnZXMocnEtPnBhZ2VfcG9vbCk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGVs
c2UKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICB4ZHBfcGFnZSA9IGFsbG9jX3BhZ2Uo
R0ZQX0FUT01JQyk7Cj4gPiA+ID4gICAgICAgICAgICAgICAgIGlmICgheGRwX3BhZ2UpCj4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiA+ID4KPiA+ID4gPiBA
QCAtMTM1NCw3ICsxMzc4LDcgQEAgc3RhdGljIHZvaWQgKm1lcmdlYWJsZV94ZHBfZ2V0X2J1Zihz
dHJ1Y3QgdmlydG5ldF9pbmZvICp2aSwKPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgKmZyYW1lX3N6
ID0gUEFHRV9TSVpFOwo+ID4gPiA+Cj4gPiA+ID4gLSAgICAgICBwdXRfcGFnZSgqcGFnZSk7Cj4g
PiA+ID4gKyAgICAgICB2aXJ0bmV0X3B1dF9wYWdlKHJxLCAqcGFnZSk7Cj4gPiA+ID4KPiA+ID4g
PiAgICAgICAgICpwYWdlID0geGRwX3BhZ2U7Cj4gPiA+ID4KPiA+ID4gPiBAQCAtMTQwMCw2ICsx
NDI0LDggQEAgc3RhdGljIHN0cnVjdCBza19idWZmICpyZWNlaXZlX21lcmdlYWJsZV94ZHAoc3Ry
dWN0IG5ldF9kZXZpY2UgKmRldiwKPiA+ID4gPiAgICAgICAgICAgICAgICAgaGVhZF9za2IgPSBi
dWlsZF9za2JfZnJvbV94ZHBfYnVmZihkZXYsIHZpLCAmeGRwLCB4ZHBfZnJhZ3NfdHJ1ZXN6KTsK
PiA+ID4gPiAgICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KCFoZWFkX3NrYikpCj4gPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGlm
IChycS0+cGFnZV9wb29sKQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHNrYl9tYXJr
X2Zvcl9yZWN5Y2xlKGhlYWRfc2tiKTsKPiA+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIGhl
YWRfc2tiOwo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICBjYXNlIFhEUF9UWDoKPiA+ID4gPiBAQCAt
MTQxMCwxMCArMTQzNiwxMCBAQCBzdGF0aWMgc3RydWN0IHNrX2J1ZmYgKnJlY2VpdmVfbWVyZ2Vh
YmxlX3hkcChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gPiA+ICAgICAgICAgICAgICAgICBi
cmVhazsKPiA+ID4gPiAgICAgICAgIH0KPiA+ID4gPgo+ID4gPiA+IC0gICAgICAgcHV0X3hkcF9m
cmFncygmeGRwKTsKPiA+ID4gPiArICAgICAgIHB1dF94ZHBfZnJhZ3MoJnhkcCwgcnEpOwo+ID4g
PiA+Cj4gPiA+ID4gIGVycl94ZHA6Cj4gPiA+ID4gLSAgICAgICBwdXRfcGFnZShwYWdlKTsKPiA+
ID4gPiArICAgICAgIHZpcnRuZXRfcHV0X3BhZ2UocnEsIHBhZ2UpOwo+ID4gPiA+ICAgICAgICAg
bWVyZ2VhYmxlX2J1Zl9mcmVlKHJxLCBudW1fYnVmLCBkZXYsIHN0YXRzKTsKPiA+ID4gPgo+ID4g
PiA+ICAgICAgICAgc3RhdHMtPnhkcF9kcm9wcysrOwo+ID4gPiA+IEBAIC0xNDY3LDYgKzE0OTMs
OSBAQCBzdGF0aWMgc3RydWN0IHNrX2J1ZmYgKnJlY2VpdmVfbWVyZ2VhYmxlKHN0cnVjdCBuZXRf
ZGV2aWNlICpkZXYsCj4gPiA+ID4gICAgICAgICBoZWFkX3NrYiA9IHBhZ2VfdG9fc2tiKHZpLCBy
cSwgcGFnZSwgb2Zmc2V0LCBsZW4sIHRydWVzaXplLCBoZWFkcm9vbSk7Cj4gPiA+ID4gICAgICAg
ICBjdXJyX3NrYiA9IGhlYWRfc2tiOwo+ID4gPiA+Cj4gPiA+ID4gKyAgICAgICBpZiAocnEtPnBh
Z2VfcG9vbCkKPiA+ID4gPiArICAgICAgICAgICAgICAgc2tiX21hcmtfZm9yX3JlY3ljbGUoY3Vy
cl9za2IpOwo+ID4gPiA+ICsKPiA+ID4gPiAgICAgICAgIGlmICh1bmxpa2VseSghY3Vycl9za2Ip
KQo+ID4gPiA+ICAgICAgICAgICAgICAgICBnb3RvIGVycl9za2I7Cj4gPiA+ID4gICAgICAgICB3
aGlsZSAoLS1udW1fYnVmKSB7Cj4gPiA+ID4gQEAgLTE1MDksNiArMTUzOCw4IEBAIHN0YXRpYyBz
dHJ1Y3Qgc2tfYnVmZiAqcmVjZWl2ZV9tZXJnZWFibGUoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwK
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBjdXJyX3NrYiA9IG5za2I7Cj4gPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgaGVhZF9za2ItPnRydWVzaXplICs9IG5za2ItPnRydWVz
aXplOwo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIG51bV9za2JfZnJhZ3MgPSAwOwo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChycS0+cGFnZV9wb29sKQo+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2tiX21hcmtfZm9yX3JlY3ljbGUoY3Vy
cl9za2IpOwo+ID4gPiA+ICAgICAgICAgICAgICAgICB9Cj4gPiA+ID4gICAgICAgICAgICAgICAg
IGlmIChjdXJyX3NrYiAhPSBoZWFkX3NrYikgewo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGhlYWRfc2tiLT5kYXRhX2xlbiArPSBsZW47Cj4gPiA+ID4gQEAgLTE1MTcsNyArMTU0OCw3
IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tfYnVmZiAqcmVjZWl2ZV9tZXJnZWFibGUoc3RydWN0IG5ldF9k
ZXZpY2UgKmRldiwKPiA+ID4gPiAgICAgICAgICAgICAgICAgfQo+ID4gPiA+ICAgICAgICAgICAg
ICAgICBvZmZzZXQgPSBidWYgLSBwYWdlX2FkZHJlc3MocGFnZSk7Cj4gPiA+ID4gICAgICAgICAg
ICAgICAgIGlmIChza2JfY2FuX2NvYWxlc2NlKGN1cnJfc2tiLCBudW1fc2tiX2ZyYWdzLCBwYWdl
LCBvZmZzZXQpKSB7Cj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcHV0X3BhZ2UocGFn
ZSk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdmlydG5ldF9wdXRfcGFnZShycSwg
cGFnZSk7Cj4gPiA+Cj4gPiA+IEkgd29uZGVyIHdoeSBub3Qgd2UgY2FuJ3QgZG8gdGhpcyBkdXJp
bmcgYnVmZmVyIGFsbG9jYXRpb24gbGlrZSBvdGhlciBkcml2ZXJzPwo+ID4gPgo+ID4KPiA+IFNv
cnJ5LCBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQgdGhlIHBvaW50IGhlcmUuIFdvdWxkIHlvdSBw
bGVhc2UKPiA+IGVsYWJvcmF0ZSBhIGJpdCBtb3JlPwo+ID4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHNrYl9jb2FsZXNjZV9yeF9mcmFnKGN1cnJfc2tiLCBudW1fc2tiX2ZyYWdzIC0gMSwK
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZW4s
IHRydWVzaXplKTsKPiA+ID4gPiAgICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ID4gPiBAQCAt
MTUzMCw3ICsxNTYxLDcgQEAgc3RhdGljIHN0cnVjdCBza19idWZmICpyZWNlaXZlX21lcmdlYWJs
ZShzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LAo+ID4gPiA+ICAgICAgICAgcmV0dXJuIGhlYWRfc2ti
Owo+ID4gPiA+Cj4gPiA+ID4gIGVycl9za2I6Cj4gPiA+ID4gLSAgICAgICBwdXRfcGFnZShwYWdl
KTsKPiA+ID4gPiArICAgICAgIHZpcnRuZXRfcHV0X3BhZ2UocnEsIHBhZ2UpOwo+ID4gPiA+ICAg
ICAgICAgbWVyZ2VhYmxlX2J1Zl9mcmVlKHJxLCBudW1fYnVmLCBkZXYsIHN0YXRzKTsKPiA+ID4g
Pgo+ID4gPiA+ICBlcnJfYnVmOgo+ID4gPiA+IEBAIC0xNzM3LDMxICsxNzY4LDQwIEBAIHN0YXRp
YyBpbnQgYWRkX3JlY3ZidWZfbWVyZ2VhYmxlKHN0cnVjdCB2aXJ0bmV0X2luZm8gKnZpLAo+ID4g
PiA+ICAgICAgICAgICogZGlzYWJsZWQgR1NPIGZvciBYRFAsIGl0IHdvbid0IGJlIGEgYmlnIGlz
c3VlLgo+ID4gPiA+ICAgICAgICAgICovCj4gPiA+ID4gICAgICAgICBsZW4gPSBnZXRfbWVyZ2Vh
YmxlX2J1Zl9sZW4ocnEsICZycS0+bXJnX2F2Z19wa3RfbGVuLCByb29tKTsKPiA+ID4gPiAtICAg
ICAgIGlmICh1bmxpa2VseSghc2tiX3BhZ2VfZnJhZ19yZWZpbGwobGVuICsgcm9vbSwgYWxsb2Nf
ZnJhZywgZ2ZwKSkpCj4gPiA+ID4gLSAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4g
PiA+ICsgICAgICAgaWYgKHJxLT5wYWdlX3Bvb2wpIHsKPiA+ID4gPiArICAgICAgICAgICAgICAg
c3RydWN0IHBhZ2UgKnBhZ2U7Cj4gPiA+ID4KPiA+ID4gPiAtICAgICAgIGJ1ZiA9IChjaGFyICop
cGFnZV9hZGRyZXNzKGFsbG9jX2ZyYWctPnBhZ2UpICsgYWxsb2NfZnJhZy0+b2Zmc2V0Owo+ID4g
PiA+IC0gICAgICAgYnVmICs9IGhlYWRyb29tOyAvKiBhZHZhbmNlIGFkZHJlc3MgbGVhdmluZyBo
b2xlIGF0IGZyb250IG9mIHBrdCAqLwo+ID4gPiA+IC0gICAgICAgZ2V0X3BhZ2UoYWxsb2NfZnJh
Zy0+cGFnZSk7Cj4gPiA+ID4gLSAgICAgICBhbGxvY19mcmFnLT5vZmZzZXQgKz0gbGVuICsgcm9v
bTsKPiA+ID4gPiAtICAgICAgIGhvbGUgPSBhbGxvY19mcmFnLT5zaXplIC0gYWxsb2NfZnJhZy0+
b2Zmc2V0Owo+ID4gPiA+IC0gICAgICAgaWYgKGhvbGUgPCBsZW4gKyByb29tKSB7Cj4gPiA+ID4g
LSAgICAgICAgICAgICAgIC8qIFRvIGF2b2lkIGludGVybmFsIGZyYWdtZW50YXRpb24sIGlmIHRo
ZXJlIGlzIHZlcnkgbGlrZWx5IG5vdAo+ID4gPiA+IC0gICAgICAgICAgICAgICAgKiBlbm91Z2gg
c3BhY2UgZm9yIGFub3RoZXIgYnVmZmVyLCBhZGQgdGhlIHJlbWFpbmluZyBzcGFjZSB0bwo+ID4g
PiA+IC0gICAgICAgICAgICAgICAgKiB0aGUgY3VycmVudCBidWZmZXIuCj4gPiA+ID4gLSAgICAg
ICAgICAgICAgICAqIFhEUCBjb3JlIGFzc3VtZXMgdGhhdCBmcmFtZV9zaXplIG9mIHhkcF9idWZm
IGFuZCB0aGUgbGVuZ3RoCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAqIG9mIHRoZSBmcmFnIGFy
ZSBQQUdFX1NJWkUsIHNvIHdlIGRpc2FibGUgdGhlIGhvbGUgbWVjaGFuaXNtLgo+ID4gPiA+IC0g
ICAgICAgICAgICAgICAgKi8KPiA+ID4gPiAtICAgICAgICAgICAgICAgaWYgKCFoZWFkcm9vbSkK
PiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBsZW4gKz0gaG9sZTsKPiA+ID4gPiAtICAg
ICAgICAgICAgICAgYWxsb2NfZnJhZy0+b2Zmc2V0ICs9IGhvbGU7Cj4gPiA+ID4gLSAgICAgICB9
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIHBhZ2UgPSBwYWdlX3Bvb2xfZGV2X2FsbG9jX3BhZ2Vz
KHJxLT5wYWdlX3Bvb2wpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoIXBh
Z2UpKQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4g
PiA+ICsgICAgICAgICAgICAgICBidWYgPSAoY2hhciAqKXBhZ2VfYWRkcmVzcyhwYWdlKTsKPiA+
ID4gPiArICAgICAgICAgICAgICAgYnVmICs9IGhlYWRyb29tOyAvKiBhZHZhbmNlIGFkZHJlc3Mg
bGVhdmluZyBob2xlIGF0IGZyb250IG9mIHBrdCAqLwo+ID4gPiA+ICsgICAgICAgfSBlbHNlIHsK
PiA+ID4gPiArICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KCFza2JfcGFnZV9mcmFnX3JlZmls
bChsZW4gKyByb29tLCBhbGxvY19mcmFnLCBnZnApKSkKPiA+ID4KPiA+ID4gV2h5IG5vdCBzaW1w
bHkgdXNlIGEgaGVscGVyIGxpa2UgdmlydG5ldF9wYWdlX2ZyYWdfcmVmaWxsKCkgYW5kIGFkZAo+
ID4gPiB0aGUgcGFnZV9wb29sIGFsbG9jYXRpb24gbG9naWMgdGhlcmU/IEl0IGhlbHBzIHRvIHJl
ZHVjZSB0aGUKPiA+ID4gY2hhbmdlc2V0Lgo+ID4gPgo+ID4KPiA+IFN1cmUuIFdpbGwgZG8gdGhh
dCBvbiB2Mi4KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsK
PiA+ID4gPgo+ID4gPiA+ICsgICAgICAgICAgICAgICBidWYgPSAoY2hhciAqKXBhZ2VfYWRkcmVz
cyhhbGxvY19mcmFnLT5wYWdlKSArIGFsbG9jX2ZyYWctPm9mZnNldDsKPiA+ID4gPiArICAgICAg
ICAgICAgICAgYnVmICs9IGhlYWRyb29tOyAvKiBhZHZhbmNlIGFkZHJlc3MgbGVhdmluZyBob2xl
IGF0IGZyb250IG9mIHBrdCAqLwo+ID4gPiA+ICsgICAgICAgICAgICAgICBnZXRfcGFnZShhbGxv
Y19mcmFnLT5wYWdlKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgYWxsb2NfZnJhZy0+b2Zmc2V0
ICs9IGxlbiArIHJvb207Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGhvbGUgPSBhbGxvY19mcmFn
LT5zaXplIC0gYWxsb2NfZnJhZy0+b2Zmc2V0Owo+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAo
aG9sZSA8IGxlbiArIHJvb20pIHsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAvKiBU
byBhdm9pZCBpbnRlcm5hbCBmcmFnbWVudGF0aW9uLCBpZiB0aGVyZSBpcyB2ZXJ5IGxpa2VseSBu
b3QKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgKiBlbm91Z2ggc3BhY2UgZm9yIGFu
b3RoZXIgYnVmZmVyLCBhZGQgdGhlIHJlbWFpbmluZyBzcGFjZSB0bwo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAqIHRoZSBjdXJyZW50IGJ1ZmZlci4KPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgKiBYRFAgY29yZSBhc3N1bWVzIHRoYXQgZnJhbWVfc2l6ZSBvZiB4ZHBf
YnVmZiBhbmQgdGhlIGxlbmd0aAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIG9m
IHRoZSBmcmFnIGFyZSBQQUdFX1NJWkUsIHNvIHdlIGRpc2FibGUgdGhlIGhvbGUgbWVjaGFuaXNt
Lgo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAqLwo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGlmICghaGVhZHJvb20pCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBsZW4gKz0gaG9sZTsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBh
bGxvY19mcmFnLT5vZmZzZXQgKz0gaG9sZTsKPiA+ID4gPiArICAgICAgICAgICAgICAgfQo+ID4g
PiA+ICsgICAgICAgfQo+ID4gPiA+ICAgICAgICAgc2dfaW5pdF9vbmUocnEtPnNnLCBidWYsIGxl
bik7Cj4gPiA+ID4gICAgICAgICBjdHggPSBtZXJnZWFibGVfbGVuX3RvX2N0eChsZW4gKyByb29t
LCBoZWFkcm9vbSk7Cj4gPiA+ID4gICAgICAgICBlcnIgPSB2aXJ0cXVldWVfYWRkX2luYnVmX2N0
eChycS0+dnEsIHJxLT5zZywgMSwgYnVmLCBjdHgsIGdmcCk7Cj4gPiA+ID4gICAgICAgICBpZiAo
ZXJyIDwgMCkKPiA+ID4gPiAtICAgICAgICAgICAgICAgcHV0X3BhZ2UodmlydF90b19oZWFkX3Bh
Z2UoYnVmKSk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIHZpcnRuZXRfcHV0X3BhZ2UocnEsIHZp
cnRfdG9faGVhZF9wYWdlKGJ1ZikpOwo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICByZXR1cm4gZXJy
Owo+ID4gPiA+ICB9Cj4gPiA+ID4gQEAgLTE5OTQsOCArMjAzNCwxNSBAQCBzdGF0aWMgaW50IHZp
cnRuZXRfZW5hYmxlX3F1ZXVlX3BhaXIoc3RydWN0IHZpcnRuZXRfaW5mbyAqdmksIGludCBxcF9p
bmRleCkKPiA+ID4gPiAgICAgICAgIGlmIChlcnIgPCAwKQo+ID4gPiA+ICAgICAgICAgICAgICAg
ICByZXR1cm4gZXJyOwo+ID4gPiA+Cj4gPiA+ID4gLSAgICAgICBlcnIgPSB4ZHBfcnhxX2luZm9f
cmVnX21lbV9tb2RlbCgmdmktPnJxW3FwX2luZGV4XS54ZHBfcnhxLAo+ID4gPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUVNX1RZUEVfUEFHRV9TSEFSRUQsIE5V
TEwpOwo+ID4gPiA+ICsgICAgICAgaWYgKHZpLT5ycVtxcF9pbmRleF0ucGFnZV9wb29sKQo+ID4g
PiA+ICsgICAgICAgICAgICAgICBlcnIgPSB4ZHBfcnhxX2luZm9fcmVnX21lbV9tb2RlbCgmdmkt
PnJxW3FwX2luZGV4XS54ZHBfcnhxLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBNRU1fVFlQRV9QQUdFX1BPT0wsCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZpLT5ycVtxcF9pbmRl
eF0ucGFnZV9wb29sKTsKPiA+ID4gPiArICAgICAgIGVsc2UKPiA+ID4gPiArICAgICAgICAgICAg
ICAgZXJyID0geGRwX3J4cV9pbmZvX3JlZ19tZW1fbW9kZWwoJnZpLT5ycVtxcF9pbmRleF0ueGRw
X3J4cSwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgTUVNX1RZUEVfUEFHRV9TSEFSRUQsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwpOwo+ID4gPiA+ICsKPiA+ID4gPiAgICAg
ICAgIGlmIChlcnIgPCAwKQo+ID4gPiA+ICAgICAgICAgICAgICAgICBnb3RvIGVycl94ZHBfcmVn
X21lbV9tb2RlbDsKPiA+ID4gPgo+ID4gPiA+IEBAIC0yOTUxLDYgKzI5OTgsNyBAQCBzdGF0aWMg
dm9pZCB2aXJ0bmV0X2dldF9zdHJpbmdzKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsIHUzMiBzdHJp
bmdzZXQsIHU4ICpkYXRhKQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZXRodG9vbF9zcHJpbnRmKCZwLCAidHhfcXVldWVfJXVfJXMiLCBpLAo+ID4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZpcnRuZXRfc3Ffc3RhdHNf
ZGVzY1tqXS5kZXNjKTsKPiA+ID4gPiAgICAgICAgICAgICAgICAgfQo+ID4gPiA+ICsgICAgICAg
ICAgICAgICBwYWdlX3Bvb2xfZXRodG9vbF9zdGF0c19nZXRfc3RyaW5ncyhwKTsKPiA+ID4gPiAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ID4gICAgICAgICB9Cj4gPiA+ID4gIH0KPiA+ID4g
PiBAQCAtMjk2MiwxMiArMzAxMCwzMCBAQCBzdGF0aWMgaW50IHZpcnRuZXRfZ2V0X3NzZXRfY291
bnQoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwgaW50IHNzZXQpCj4gPiA+ID4gICAgICAgICBzd2l0
Y2ggKHNzZXQpIHsKPiA+ID4gPiAgICAgICAgIGNhc2UgRVRIX1NTX1NUQVRTOgo+ID4gPiA+ICAg
ICAgICAgICAgICAgICByZXR1cm4gdmktPmN1cnJfcXVldWVfcGFpcnMgKiAoVklSVE5FVF9SUV9T
VEFUU19MRU4gKwo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgVklSVE5FVF9TUV9TVEFUU19MRU4pOwo+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVklSVE5FVF9TUV9TVEFUU19MRU4gKwo+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChwYWdl
X3Bvb2xfZW5hYmxlZCAmJiB2aS0+bWVyZ2VhYmxlX3J4X2J1ZnMgPwo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlX3Bvb2xfZXRodG9v
bF9zdGF0c19nZXRfY291bnQoKSA6IDApKTsKPiA+ID4gPiAgICAgICAgIGRlZmF1bHQ6Cj4gPiA+
ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiA+ID4gPiAgICAgICAgIH0K
PiA+ID4gPiAgfQo+ID4gPiA+Cj4gPiA+ID4gK3N0YXRpYyB2b2lkIHZpcnRuZXRfZ2V0X3BhZ2Vf
cG9vbF9zdGF0cyhzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LCB1NjQgKmRhdGEpCj4gPiA+ID4gK3sK
PiA+ID4gPiArI2lmZGVmIENPTkZJR19QQUdFX1BPT0xfU1RBVFMKPiA+ID4gPiArICAgICAgIHN0
cnVjdCB2aXJ0bmV0X2luZm8gKnZpID0gbmV0ZGV2X3ByaXYoZGV2KTsKPiA+ID4gPiArICAgICAg
IHN0cnVjdCBwYWdlX3Bvb2xfc3RhdHMgcHBfc3RhdHMgPSB7fTsKPiA+ID4gPiArICAgICAgIGlu
dCBpOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCB2aS0+Y3Vycl9x
dWV1ZV9wYWlyczsgaSsrKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmICghdmktPnJxW2ld
LnBhZ2VfcG9vbCkKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+
ID4gPiArICAgICAgICAgICAgICAgcGFnZV9wb29sX2dldF9zdGF0cyh2aS0+cnFbaV0ucGFnZV9w
b29sLCAmcHBfc3RhdHMpOwo+ID4gPiA+ICsgICAgICAgfQo+ID4gPiA+ICsgICAgICAgcGFnZV9w
b29sX2V0aHRvb2xfc3RhdHNfZ2V0KGRhdGEsICZwcF9zdGF0cyk7Cj4gPiA+ID4gKyNlbmRpZiAv
KiBDT05GSUdfUEFHRV9QT09MX1NUQVRTICovCj4gPiA+ID4gK30KPiA+ID4gPiArCj4gPiA+ID4g
IHN0YXRpYyB2b2lkIHZpcnRuZXRfZ2V0X2V0aHRvb2xfc3RhdHMoc3RydWN0IG5ldF9kZXZpY2Ug
KmRldiwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBldGh0b29sX3N0YXRzICpzdGF0cywgdTY0ICpkYXRhKQo+ID4gPiA+ICB7Cj4gPiA+ID4gQEAg
LTMwMDMsNiArMzA2OSw4IEBAIHN0YXRpYyB2b2lkIHZpcnRuZXRfZ2V0X2V0aHRvb2xfc3RhdHMo
c3RydWN0IG5ldF9kZXZpY2UgKmRldiwKPiA+ID4gPiAgICAgICAgICAgICAgICAgfSB3aGlsZSAo
dTY0X3N0YXRzX2ZldGNoX3JldHJ5KCZzcS0+c3RhdHMuc3luY3AsIHN0YXJ0KSk7Cj4gPiA+ID4g
ICAgICAgICAgICAgICAgIGlkeCArPSBWSVJUTkVUX1NRX1NUQVRTX0xFTjsKPiA+ID4gPiAgICAg
ICAgIH0KPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICB2aXJ0bmV0X2dldF9wYWdlX3Bvb2xfc3Rh
dHMoZGV2LCAmZGF0YVtpZHhdKTsKPiA+ID4gPiAgfQo+ID4gPiA+Cj4gPiA+ID4gIHN0YXRpYyB2
b2lkIHZpcnRuZXRfZ2V0X2NoYW5uZWxzKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsCj4gPiA+ID4g
QEAgLTM2MjMsNiArMzY5MSw4IEBAIHN0YXRpYyB2b2lkIHZpcnRuZXRfZnJlZV9xdWV1ZXMoc3Ry
dWN0IHZpcnRuZXRfaW5mbyAqdmkpCj4gPiA+ID4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgdmkt
Pm1heF9xdWV1ZV9wYWlyczsgaSsrKSB7Cj4gPiA+ID4gICAgICAgICAgICAgICAgIF9fbmV0aWZf
bmFwaV9kZWwoJnZpLT5ycVtpXS5uYXBpKTsKPiA+ID4gPiAgICAgICAgICAgICAgICAgX19uZXRp
Zl9uYXBpX2RlbCgmdmktPnNxW2ldLm5hcGkpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAo
dmktPnJxW2ldLnBhZ2VfcG9vbCkKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBwYWdl
X3Bvb2xfZGVzdHJveSh2aS0+cnFbaV0ucGFnZV9wb29sKTsKPiA+ID4gPiAgICAgICAgIH0KPiA+
ID4gPgo+ID4gPiA+ICAgICAgICAgLyogV2UgY2FsbGVkIF9fbmV0aWZfbmFwaV9kZWwoKSwKPiA+
ID4gPiBAQCAtMzY3OSwxMiArMzc0OSwxOSBAQCBzdGF0aWMgdm9pZCB2aXJ0bmV0X3JxX2ZyZWVf
dW51c2VkX2J1ZihzdHJ1Y3QgdmlydHF1ZXVlICp2cSwgdm9pZCAqYnVmKQo+ID4gPiA+ICAgICAg
ICAgc3RydWN0IHZpcnRuZXRfaW5mbyAqdmkgPSB2cS0+dmRldi0+cHJpdjsKPiA+ID4gPiAgICAg
ICAgIGludCBpID0gdnEycnhxKHZxKTsKPiA+ID4gPgo+ID4gPiA+IC0gICAgICAgaWYgKHZpLT5t
ZXJnZWFibGVfcnhfYnVmcykKPiA+ID4gPiAtICAgICAgICAgICAgICAgcHV0X3BhZ2UodmlydF90
b19oZWFkX3BhZ2UoYnVmKSk7Cj4gPiA+ID4gLSAgICAgICBlbHNlIGlmICh2aS0+YmlnX3BhY2tl
dHMpCj4gPiA+ID4gKyAgICAgICBpZiAodmktPm1lcmdlYWJsZV9yeF9idWZzKSB7Cj4gPiA+ID4g
KyAgICAgICAgICAgICAgIGlmICh2aS0+cnFbaV0ucGFnZV9wb29sKSB7Cj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcGFnZV9wb29sX3B1dF9mdWxsX3BhZ2UodmktPnJxW2ldLnBhZ2Vf
cG9vbCwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB2aXJ0X3RvX2hlYWRfcGFnZShidWYpLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUpOwo+ID4gPiA+ICsgICAgICAgICAgICAg
ICB9IGVsc2Ugewo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHB1dF9wYWdlKHZpcnRf
dG9faGVhZF9wYWdlKGJ1ZikpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiA+ID4gKyAg
ICAgICB9IGVsc2UgaWYgKHZpLT5iaWdfcGFja2V0cykgewo+ID4gPiA+ICAgICAgICAgICAgICAg
ICBnaXZlX3BhZ2VzKCZ2aS0+cnFbaV0sIGJ1Zik7Cj4gPiA+Cj4gPiA+IEFueSByZWFzb24gb25s
eSBtZXJnZWFibGUgd2VyZSBtb2RpZmllZCBidXQgbm90IGZvciBzbWFsbCBhbmQgYmlnPwo+ID4g
Pgo+ID4gPiBUaGFua3MKPiA+ID4KPiA+Cj4gPiBCaWcgbW9kZSB1c2VzIHRoZSBwYWdlIGNoYWlu
IHRvIHJlY3ljbGUgcGFnZXMsIHRodXMgdGhlIHVzaW5nIG9mCj4gPiAicHJpdmF0ZSIgb2YgdGhl
IGJ1ZmZlciBwYWdlLiBJIHdpbGwgdGFrZSBmdXJ0aGVyIGxvb2sgaW50byB0aGF0IHRvCj4gPiBz
ZWUgaWYgaXQgaXMgYmV0dGVyIHRvIHVzZSBwYWdlIHBvb2wgaW4gdGhlc2UgY2FzZXMuIFRoYW5r
cyEKPiA+Cj4gPgo+ID4KPiA+ID4gPiAtICAgICAgIGVsc2UKPiA+ID4gPiArICAgICAgIH0gZWxz
ZSB7Cj4gPiA+ID4gICAgICAgICAgICAgICAgIHB1dF9wYWdlKHZpcnRfdG9faGVhZF9wYWdlKGJ1
ZikpOwo+ID4gPiA+ICsgICAgICAgfQo+ID4gPiA+ICB9Cj4gPiA+ID4KPiA+ID4gPiAgc3RhdGlj
IHZvaWQgZnJlZV91bnVzZWRfYnVmcyhzdHJ1Y3QgdmlydG5ldF9pbmZvICp2aSkKPiA+ID4gPiBA
QCAtMzcxOCw2ICszNzk1LDI2IEBAIHN0YXRpYyB2b2lkIHZpcnRuZXRfZGVsX3ZxcyhzdHJ1Y3Qg
dmlydG5ldF9pbmZvICp2aSkKPiA+ID4gPiAgICAgICAgIHZpcnRuZXRfZnJlZV9xdWV1ZXModmkp
Owo+ID4gPiA+ICB9Cj4gPiA+ID4KPiA+ID4gPiArc3RhdGljIHZvaWQgdmlydG5ldF9hbGxvY19w
YWdlX3Bvb2woc3RydWN0IHJlY2VpdmVfcXVldWUgKnJxKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAg
ICAgICBzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiA9IHJxLT52cS0+dmRldjsKPiA+ID4gPiAr
Cj4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgcGFnZV9wb29sX3BhcmFtcyBwcF9wYXJhbXMgPSB7Cj4g
PiA+ID4gKyAgICAgICAgICAgICAgIC5vcmRlciA9IDAsCj4gPiA+ID4gKyAgICAgICAgICAgICAg
IC5wb29sX3NpemUgPSBycS0+dnEtPm51bV9tYXgsCj4gPiA+ID4gKyAgICAgICAgICAgICAgIC5u
aWQgPSBkZXZfdG9fbm9kZSh2ZGV2LT5kZXYucGFyZW50KSwKPiA+ID4gPiArICAgICAgICAgICAg
ICAgLmRldiA9IHZkZXYtPmRldi5wYXJlbnQsCj4gPiA+ID4gKyAgICAgICAgICAgICAgIC5vZmZz
ZXQgPSAwLAo+ID4gPiA+ICsgICAgICAgfTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICBycS0+
cGFnZV9wb29sID0gcGFnZV9wb29sX2NyZWF0ZSgmcHBfcGFyYW1zKTsKPiA+ID4gPiArICAgICAg
IGlmIChJU19FUlIocnEtPnBhZ2VfcG9vbCkpIHsKPiA+ID4gPiArICAgICAgICAgICAgICAgZGV2
X3dhcm4oJnZkZXYtPmRldiwgInBhZ2UgcG9vbCBjcmVhdGlvbiBmYWlsZWQ6ICVsZFxuIiwKPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgUFRSX0VSUihycS0+cGFnZV9wb29sKSk7Cj4g
PiA+ID4gKyAgICAgICAgICAgICAgIHJxLT5wYWdlX3Bvb2wgPSBOVUxMOwo+ID4gPiA+ICsgICAg
ICAgfQo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICAvKiBIb3cgbGFyZ2Ugc2hvdWxkIGEg
c2luZ2xlIGJ1ZmZlciBiZSBzbyBhIHF1ZXVlIGZ1bGwgb2YgdGhlc2UgY2FuIGZpdCBhdAo+ID4g
PiA+ICAgKiBsZWFzdCBvbmUgZnVsbCBwYWNrZXQ/Cj4gPiA+ID4gICAqIExvZ2ljIGJlbG93IGFz
c3VtZXMgdGhlIG1lcmdlYWJsZSBidWZmZXIgaGVhZGVyIGlzIHVzZWQuCj4gPiA+ID4gQEAgLTM4
MDEsNiArMzg5OCwxMyBAQCBzdGF0aWMgaW50IHZpcnRuZXRfZmluZF92cXMoc3RydWN0IHZpcnRu
ZXRfaW5mbyAqdmkpCj4gPiA+ID4gICAgICAgICAgICAgICAgIHZpLT5ycVtpXS52cSA9IHZxc1ty
eHEydnEoaSldOwo+ID4gPiA+ICAgICAgICAgICAgICAgICB2aS0+cnFbaV0ubWluX2J1Zl9sZW4g
PSBtZXJnZWFibGVfbWluX2J1Zl9sZW4odmksIHZpLT5ycVtpXS52cSk7Cj4gPiA+ID4gICAgICAg
ICAgICAgICAgIHZpLT5zcVtpXS52cSA9IHZxc1t0eHEydnEoaSldOwo+ID4gPiA+ICsKPiA+ID4g
PiArICAgICAgICAgICAgICAgaWYgKHBhZ2VfcG9vbF9lbmFibGVkICYmIHZpLT5tZXJnZWFibGVf
cnhfYnVmcykKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICB2aXJ0bmV0X2FsbG9jX3Bh
Z2VfcG9vbCgmdmktPnJxW2ldKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgZWxzZQo+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGRldl93YXJuKCZ2aS0+dmRldi0+ZGV2LAo+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJwYWdlIHBvb2wgb25seSBzdXBwb3J0
IG1lcmdlYWJsZSBtb2RlXG4iKTsKPiA+ID4gPiArCj4gPiA+ID4gICAgICAgICB9Cj4gPiA+ID4K
PiA+ID4gPiAgICAgICAgIC8qIHJ1biBoZXJlOiByZXQgPT0gMC4gKi8KPiA+ID4gPiAtLQo+ID4g
PiA+IDIuMzEuMQo+ID4gPiA+Cj4gPiA+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
