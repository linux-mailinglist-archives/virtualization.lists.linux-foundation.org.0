Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2C91A8AF9
	for <lists.virtualization@lfdr.de>; Tue, 14 Apr 2020 21:38:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F1B9A856E8;
	Tue, 14 Apr 2020 19:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yt84jXC8JQqh; Tue, 14 Apr 2020 19:38:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5847E85C28;
	Tue, 14 Apr 2020 19:38:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3598FC0172;
	Tue, 14 Apr 2020 19:38:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6524EC0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 19:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4C98387C8C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 19:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iW4dWAK4Mujy
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 19:38:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5293F81D5C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 19:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586893087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K7rEujuH9mCHHkQNQF3bIC7vs8ss/qE9yTiJvgoWENY=;
 b=Y4Qcwph2AKj47gmOObG9ZVNjYS6vYNQyBMkIrXpegtRoUGx4dg4Vn81QDwYup5LdC9OQHq
 VT8bRepDFEfXiUto6O/3XBendsT1M/zBwRTXjhkAVju1XDZtfZj2oUt7bORlG+fMdGNsS7
 SC9dF7AZbPD/YICZRYW4XIUExh9iObk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-BEtuMjG3PL-f8LyKeyu6gQ-1; Tue, 14 Apr 2020 15:38:03 -0400
X-MC-Unique: BEtuMjG3PL-f8LyKeyu6gQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A5A58017F3;
 Tue, 14 Apr 2020 19:37:58 +0000 (UTC)
Received: from llong.remote.csb (ovpn-118-173.rdu2.redhat.com [10.10.118.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0277F100E7E3;
 Tue, 14 Apr 2020 19:37:51 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] crypto: Remove unnecessary memzero_explicit()
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20200413211550.8307-1-longman@redhat.com>
 <20200413222846.24240-1-longman@redhat.com>
 <eca85e0b-0af3-c43a-31e4-bd5c3f519798@c-s.fr>
 <e194a51f-a5e5-a557-c008-b08cac558572@redhat.com>
 <20200414191601.GZ25468@kitsune.suse.cz>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <578fe9b6-1ccd-2698-60aa-96c3f2dd2c31@redhat.com>
Date: Tue, 14 Apr 2020 15:37:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200414191601.GZ25468@kitsune.suse.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: linux-btrfs@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 kasan-dev@googlegroups.com, samba-technical@lists.samba.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 James Morris <jmorris@namei.org>, Matthew Wilcox <willy@infradead.org>,
 cocci@systeme.lip6.fr, linux-wpan@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-integrity@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, linux-cifs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, target-devel@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 4/14/20 3:16 PM, Michal Such=E1nek wrote:
> On Tue, Apr 14, 2020 at 12:24:36PM -0400, Waiman Long wrote:
>> On 4/14/20 2:08 AM, Christophe Leroy wrote:
>>>
>>> Le 14/04/2020 =E0 00:28, Waiman Long a =E9crit=A0:
>>>> Since kfree_sensitive() will do an implicit memzero_explicit(), there
>>>> is no need to call memzero_explicit() before it. Eliminate those
>>>> memzero_explicit() and simplify the call sites. For better correctness,
>>>> the setting of keylen is also moved down after the key pointer check.
>>>>
>>>> Signed-off-by: Waiman Long <longman@redhat.com>
>>>> ---
>>>> =A0 .../allwinner/sun8i-ce/sun8i-ce-cipher.c=A0=A0=A0=A0=A0 | 19 +++++=
-------------
>>>> =A0 .../allwinner/sun8i-ss/sun8i-ss-cipher.c=A0=A0=A0=A0=A0 | 20 +++++=
--------------
>>>> =A0 drivers/crypto/amlogic/amlogic-gxl-cipher.c=A0=A0 | 12 +++--------
>>>> =A0 drivers/crypto/inside-secure/safexcel_hash.c=A0 |=A0 3 +--
>>>> =A0 4 files changed, 14 insertions(+), 40 deletions(-)
>>>>
>>>> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
>>>> b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
>>>> index aa4e8fdc2b32..8358fac98719 100644
>>>> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
>>>> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
>>>> @@ -366,10 +366,7 @@ void sun8i_ce_cipher_exit(struct crypto_tfm *tfm)
>>>> =A0 {
>>>> =A0=A0=A0=A0=A0 struct sun8i_cipher_tfm_ctx *op =3D crypto_tfm_ctx(tfm=
);
>>>> =A0 -=A0=A0=A0 if (op->key) {
>>>> -=A0=A0=A0=A0=A0=A0=A0 memzero_explicit(op->key, op->keylen);
>>>> -=A0=A0=A0=A0=A0=A0=A0 kfree(op->key);
>>>> -=A0=A0=A0 }
>>>> +=A0=A0=A0 kfree_sensitive(op->key);
>>>> =A0=A0=A0=A0=A0 crypto_free_sync_skcipher(op->fallback_tfm);
>>>> =A0=A0=A0=A0=A0 pm_runtime_put_sync_suspend(op->ce->dev);
>>>> =A0 }
>>>> @@ -391,14 +388,11 @@ int sun8i_ce_aes_setkey(struct crypto_skcipher
>>>> *tfm, const u8 *key,
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_dbg(ce->dev, "ERROR: Invalid keylen %u=
\n", keylen);
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
>>>> =A0=A0=A0=A0=A0 }
>>>> -=A0=A0=A0 if (op->key) {
>>>> -=A0=A0=A0=A0=A0=A0=A0 memzero_explicit(op->key, op->keylen);
>>>> -=A0=A0=A0=A0=A0=A0=A0 kfree(op->key);
>>>> -=A0=A0=A0 }
>>>> -=A0=A0=A0 op->keylen =3D keylen;
>>>> +=A0=A0=A0 kfree_sensitive(op->key);
>>>> =A0=A0=A0=A0=A0 op->key =3D kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
>>>> =A0=A0=A0=A0=A0 if (!op->key)
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;
>>>> +=A0=A0=A0 op->keylen =3D keylen;
>>> Does it matter at all to ensure op->keylen is not set when of->key is
>>> NULL ? I'm not sure.
>>>
>>> But if it does, then op->keylen should be set to 0 when freeing op->key=
. =

>> My thinking is that if memory allocation fails, we just don't touch
>> anything and return an error code. I will not explicitly set keylen to 0
>> in this case unless it is specified in the API documentation.
> You already freed the key by now so not touching anything is not
> possible. The key is set to NULL on allocation failure so setting keylen
> to 0 should be redundant. However, setting keylen to 0 is consisent with
> not having a key, and it avoids the possibility of leaking the length
> later should that ever cause any problem.

OK, I can change it to clear the key length when the allocation failed
which isn't likely.

Cheers,
Longman


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
